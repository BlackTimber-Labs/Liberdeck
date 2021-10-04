import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';

import '../provider/user_provider.dart';

import '../widgets/back_button.dart';
import '../widgets/sub_screen/sub_main_view.dart';
import '../widgets/text_header.dart';

/// Root Widget of the Subject Screen
class SubScreen extends StatefulWidget {
  ///
  const SubScreen({Key? key}) : super(key: key);

  /// Route Name of the Subject Screen
  static const String routename = '/sub';

  @override
  _SubScreenState createState() => _SubScreenState();
}

class _SubScreenState extends State<SubScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final User userInstance = FirebaseAuth.instance.currentUser!;
    final UserProvider provider =
        Provider.of<UserProvider>(context, listen: false);
    final UserModel user = provider.user;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height * 0.3,
              width: width,
              //color: Colors.amber,
              child: TextHeader(
                width: width * 0.8,
                height: height,
                topRight: 'assets/images/sub_TopRight.png',
                topLeft: 'assets/images/sub_TopLeft.png',
                subTitle: 'What Subject do \n you want to see?',
                title: 'Hey ${user.name.split(" ")[0].toUpperCase()}!',
              ),
            ),
            Container(
              height: height * 0.62,
              width: width,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
              ),
              child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(userInstance.uid)
                      .get()
                      .then((DocumentSnapshot<Map<String, dynamic>> userData) {
                    provider.userData(
                      userData.get('name').toString(),
                      userData.get('uid').toString(),
                      userData.get('email').toString(),
                      userData.get('course').toString(),
                      userData.get('courseID').toString(),
                      userData.get('department').toString(),
                      userData.get('departmentID').toString(),
                      userData.get('semester').toString(),
                      userData.get('semID') as int,
                    );
                  }),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return SubMainView(
                        height: height,
                        width: width,
                        courseID: user.courseID,
                        departmentID: user.departmentID,
                        semID: user.semID,
                      );
                    }
                  }),
            ),
            BackButtonWidget(),
          ],
        ),
      ),
    );
  }
}

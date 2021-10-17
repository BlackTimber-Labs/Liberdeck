import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // String courseID = 'courseID';
  // String departmentID = 'departmentID';
  // int semID = 0;

  // Future<SharedPreferences> Data() async {
  //   return SharedPreferences.getInstance();
  // }

  // Future<void> data() async {
  //   await Data().then((value) {
  //     setState(() {
  //       courseID = value.getString('courseID') ?? 'courseID';
  //       departmentID = value.getString('departmentID') ?? 'departmentID';
  //       semID = value.getInt('semID') ?? 0;
  //     });
  //     print(courseID);
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   data();
  // }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final User userInstance = FirebaseAuth.instance.currentUser!;
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as SubScreenArguments;
    // final UserProvider user = Provider.of<UserProvider>(context, listen: false);
    //final UserModel user = user.user;

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
                title:
                    'Hey ${userInstance.displayName!.split(" ")[0].toUpperCase()}!',
              ),
            ),
            Container(
              height: height * 0.60,
              width: width,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
              ),
              // child: FutureBuilder(
              //     future: FirebaseFirestore.instance
              //         .collection('users')
              //         .doc(userInstance.uid)
              //         .get()
              //         .then((DocumentSnapshot<Map<String, dynamic>> userData) {
              //       user.userData(
              //         // name = userData.get('name').toString(),
              //         // userData.get('uid').toString(),
              //         // userData.get('email').toString(),
              //         // userData.get('course').toString(),
              //         // userData.get('courseID').toString(),
              //         // userData.get('department').toString(),
              //         // userData.get('departmentID').toString(),
              //         // sem: userData.get('semester').toString(),
              //         // semID:userData.get('semID') as int,
              //       );
              //     }),
              //     builder: (
              //       BuildContext context,
              //       AsyncSnapshot snapshot,
              //     ) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       } else {
              //         return SubMainView(
              //           height: height,
              //           width: width,
              //           courseID: user.user.courseID,
              //           departmentID: user.user.departmentID,
              //           semID: user.user.semID,
              //         );
              //       }
              //     }),
              child: StreamBuilder<SharedPreferences>(
                  stream: SharedPreferences.getInstance().asStream(),
                  builder: (
                    context,
                    snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final courseID = snapshot.data!.getString('courseID');
                      final departmentID =
                          snapshot.data!.getString('departmentID');
                      final semID = snapshot.data!.getInt('semID');
                      return SubMainView(
                        height: height,
                        width: width,
                        courseID: courseID.toString(),
                        departmentID: departmentID.toString(),
                        semID: semID ?? 0,
                      );
                    }
                  }),
            ),
            // BackButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class SubScreenArguments {
  SubScreenArguments({
    required this.departmentID,
    required this.courseID,
    required this.semID,
  });
  final String departmentID;
  final String courseID;
  final int semID;
}

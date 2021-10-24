import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
              child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (
                  context,
                  snapshot,
                ) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    // final courseID = snapshot.data!.getString('courseID');
                    // final departmentID =
                    //     snapshot.data!.getString('departmentID');
                    // final semID = snapshot.data!.getInt('semID');
                    final courseID = snapshot.data!.get('courseID');
                    final departmentID = snapshot.data!.get('departmentID');
                    final semID = int.parse(
                      snapshot.data!.get('semID').toString(),
                    );
                    return SubMainView(
                      height: height,
                      width: width,
                      courseID: courseID.toString(),
                      departmentID: departmentID.toString(),
                      semID: semID,
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'An Error Occured',
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text(
                        'An Error Occured',
                      ),
                    );
                  }
                },
              ),
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

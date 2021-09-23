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
    final SubScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as SubScreenArguments;
final User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height * 0.3,
              width: width,
              //color: Colors.amber,
              child: TextHeader(
                width: width,
                height: height,
                topRight: 'assets/images/sub_TopRight.png',
                topLeft: 'assets/images/sub_TopLeft.png',
                subTitle: 'What Subject do you \n want to see?',
                title: 'Hey ${user.displayName!.toUpperCase()}!',
              ),
            ),
            Container(
              height: height * 0.62,
              width: width,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
              ),
              child: SubMainView(
                height: height,
                width: width,
                courseID: args.courseID,
                departmentID: args.departmentID,
                semID: args.semID,
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            
          ],
        ),
      ),
    );
  }
}

class SubScreenArguments {
  String departmentID;
  String courseID;
  int semID;
  SubScreenArguments(
    this.courseID,
    this.departmentID,
    this.semID,
  );
}

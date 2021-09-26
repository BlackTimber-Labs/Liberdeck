import 'package:flutter/material.dart';

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
    final SubScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as SubScreenArguments;
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
                title: '',
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
            BackButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class SubScreenArguments {
  SubScreenArguments(
    this.courseID,
    this.departmentID,
    this.semID,
  );
  String departmentID;
  String courseID;
  int semID;
}

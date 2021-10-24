import 'package:flutter/material.dart';

import '../widgets/course_screen/course_main_view.dart';
import '../widgets/image_header.dart';

/// Root Widget of the Subject's Chapters Screen
class CourseScreen extends StatelessWidget {
  ///
  const CourseScreen({Key? key}) : super(key: key);

  /// Route Name of the Screen
  static const String routename = '/course_screen';
//   @override
//   _CourseScreenState createState() => _CourseScreenState();
// }

// class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: height * 0.3,
            width: width,
            //color: Colors.amber,
            child: const ImageHeader(
              topCenter: 'assets/images/sub_chp_TopCenter.png',
              topLeft: 'assets/images/sub_chp_TopLeft.png',
              topRight: 'assets/images/sub_chp_TopRight.png',
            ),
          ),
          Container(
            height: height * 0.65,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.08,
            ),
            //color: Colors.amber,
            child: CourseMainView(
              height: height,
              width: width,
            ),
          ),
          
        ],
      ),
    );
  }
}

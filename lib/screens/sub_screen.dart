import 'package:flutter/material.dart';

import '../widgets/empty_bottom_bar.dart';
import '../widgets/sub_screen/sub_main_view.dart';
import '../widgets/text_header.dart';

class SubScreen extends StatefulWidget {
  const SubScreen({Key? key}) : super(key: key);
  static const String routename = '/sub';
  @override
  _SubScreenState createState() => _SubScreenState();
}

class _SubScreenState extends State<SubScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: height * 0.3,
            width: width,
            //color: Colors.amber,
            child: TextHeader(
              width: width,
              height: height,
              topright: 'assets/images/sub/top_right.png',
              topleft: 'assets/images/sub/top_left.png',
              subtitle: 'What Subject do you \n want to see?',
              title: 'Hey ABC!',
            ),
          ),
          Container(
            height: height * 0.62,
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
            ),
            child: SubMainView(height: height, width: width),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          EmptyBottomBar(height: height),
        ],
      ),
    );
  }
}

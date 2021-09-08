import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/sub_screen/header.dart';
import '../widgets/sub_screen/main_view.dart';

class SubScreen extends StatefulWidget {
  const SubScreen({Key? key}) : super(key: key);
  static const routename = "/sub";
  @override
  _SubScreenState createState() => _SubScreenState();
}

class _SubScreenState extends State<SubScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * 0.3,
            width: width,
            //color: Colors.amber,
            child: Header(width: width, height: height),
          ),
          Container(
            height: height * 0.62,
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
            ),
            child: MainView(height: height, width: width),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          BottomBar(height: height),
        ],
      ),
    );
  }
}


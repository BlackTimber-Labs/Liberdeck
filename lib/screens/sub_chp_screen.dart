import 'package:flutter/material.dart';

import '../widgets/empty_bottom_bar.dart';
import '../widgets/image_header.dart';
import '../widgets/sub_chp_screen/sub_chp_main_view.dart';

/// Root Widget of the Subject's Chapters Screen
class SubChpScreen extends StatefulWidget {
  ///
  const SubChpScreen({Key? key}) : super(key: key);

  /// Route Name of the Screen
  static const String routename = '/sub_chp';
  @override
  _SubChpScreenState createState() => _SubChpScreenState();
}

class _SubChpScreenState extends State<SubChpScreen> {
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
            child: const ImageHeader(
              topCenter: 'assets/images/sub_chp_screen/top_center.png',
              topLeft: 'assets/images/sub_chp_screen/top_left.png',
              topRight: 'assets/images/sub_chp_screen/top_right.png',
            ),
          ),
          Container(
            height: height * 0.65,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.08,
            ),
            //color: Colors.amber,
            child: SubChpMainView(height: height, width: width),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          EmptyBottomBar(height: height),
        ],
      ),
    );
  }
}

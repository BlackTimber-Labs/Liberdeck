import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/image_header.dart';
import '../widgets/profile_screen/profile_info.dart';

class ProfileScreen extends StatefulWidget {
  static const String routename = '/profile_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height * 0.3,
              width: width,
              child: const ImageHeader(
                topCenter: 'assets/images/profileCenter.png',
                topLeft: 'assets/images/profileTopLeft.png',
                topRight: 'assets/images/profileTopRight.png',
              ),
            ),
            Column(
              children: <Widget>[
                const Center(
                  child: Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                ProfileInfo(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

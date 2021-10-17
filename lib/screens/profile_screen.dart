import 'package:flutter/material.dart';

import '../widgets/image_header.dart';
import '../widgets/profile_screen/profile_info.dart';
import 'about_dev_screen.dart';

/// Root Widget of the Profile View Screen
class ProfileScreen extends StatefulWidget {
  /// Route Name of the Profile View Screen
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
                Center(
                  child: TextButton(
                    child: const Text(
                      'About developers',
                      style:
                          TextStyle(fontSize: 19.5, color: Color(0xFF000000)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AboutDevScreen.routename);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

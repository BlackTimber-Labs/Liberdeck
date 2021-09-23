import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/profile_screen/profile_info.dart';


class ProfileScreen extends StatefulWidget {
  static const String routename = '/profile_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: height * 0.26,
              width: width,
              child: ProfileHeader(),
            ),
            Column(
              children: [
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

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            child: const Image(
              image: AssetImage('assets/images/profileTopLeft.png'),
            ),
          ),
          top: 0,
          left: 0,
        ),
        Positioned(
          child: Container(
            child: const Image(
              image: AssetImage('assets/images/profileTopRight.png'),
            ),
          ),
          top: 0,
          right: 0,
        ),
        Positioned(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: const Image(
              image: AssetImage('assets/images/profileCenter.png'),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './department_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const String routename = '/profile_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 0;
  final tabs = [
    Cont(),
    BodyS(),
    //todo change this as per your need.
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedFontSize: 15,
          selectedIconTheme: IconThemeData(size: 30),
          unselectedIconTheme: IconThemeData(size: 23.5),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF843622),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
                color: Color(0xFFF8F8F8),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidBookmark,
                    color: Color(0xFFF8F8F8)),
                label: 'Bookmark'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidUserCircle,
                    color: Color(0xFFF8F8F8)),
                label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.signOutAlt,
                  color: Color(0xFFF8F8F8),
                ),
                label: 'Log Out'),
          ],
        ),
        backgroundColor: Color(0xFFFFFFFF),
        body: BodyS());
  }
}

class BodyS extends StatefulWidget {
  @override
  _BodySState createState() => _BodySState();
}

class _BodySState extends State<BodyS> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: height * 0.26,
            width: width,
            child: ProfileHeader(),
          ),
          Column(
            children: <Widget>[
              Center(
                  child: Text(
                'My Profile',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0),
              )),
              ProfileInfo(),
            ],
          ),
        ],
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
            child: Image(
              image: AssetImage('assets/images/profileTopLeft.png'),
            ),
          ),
          top: 0,
          left: 0,
        ),
        Positioned(
          child: Container(
            child: Image(
              image: AssetImage('assets/images/profileTopRight.png'),
            ),
          ),
          top: 0,
          right: 0,
        ),
        Positioned(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Image(
              image: AssetImage('assets/images/profileCenter.png'),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'INFORMATION',
          style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'BRANCH :',
              style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 80),
            Text(
              ' CSE',
              style: TextStyle(
                  fontSize: 19.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFC95A2B)),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'YEAR :',
              style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 110),
            Text(
              ' 2nd',
              style: TextStyle(
                  fontSize: 19.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFC95A2B)),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'SEMESTER :',
              style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 60),
            Text(
              ' 3rd',
              style: TextStyle(
                  fontSize: 19.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFC95A2B)),
            ),
          ],
        ),
        SizedBox(height: 30.0),
        Divider(thickness: 1.0, color: Color(0xFF843622)),
        SizedBox(height: 30.0),
        Text(
          'ACCOUNT',
          style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'NAME :',
              style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 100),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  user.displayName!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 19.5,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFC95A2B)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'EMAIL :',
              style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 95),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  user.email!,
                  style: TextStyle(
                      fontSize: 19.5,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFC95A2B)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Center(
          child: TextButton(
            child: Text(
              'About developers',
              style: TextStyle(fontSize: 19.5, color: Color(0xFF000000)),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

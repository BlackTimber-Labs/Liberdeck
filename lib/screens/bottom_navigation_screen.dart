import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:liberdeck/provider/google_sign_in.dart';
import './about_screen.dart';
import './department_screen.dart';
import './profile_screen.dart';
import './saved_book_screen.dart';
// import 'package:provider/provider.dart';



class BottomNavigationScreen extends StatefulWidget {
  static const String routename = '/bottom_navigation_screen';
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final tabs = [
    DepartmentScreen(),
    SavedBooksScreen(),
    ProfileScreen(),
    AboutScreen(),
    //todo change this as per your need.
    // provider.logout(),
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
        items: const[
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
      body: SafeArea(child: tabs[_currentIndex]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './login_screen.dart';
import './profile_screen.dart';
import './saved_book_screen.dart';
import './sub_screen.dart';

import '../provider/google_sign_in.dart';

/// Root widget of the Bottom Navigation Screen
class BottomNavigationScreen extends StatefulWidget {
  /// Route name of the Bottom Navigation Screen
  static const String routename = '/bottom_navigation_screen';

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  List<Map<String, Widget>> tabs = <Map<String, Widget>>[<String, Widget>{}];

  @override
  void initState() {
    tabs = <Map<String, Widget>>[
      <String, Widget>{'page': const SubScreen()},
      <String, Widget>{'page': SavedBooksScreen()},
      <String, Widget>{'page': ProfileScreen()},
      <String, Widget>{
        'page': AlertDialog(
          title: const Text('Logout?'),
          content: const Text('Are you sure, you wanna log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  GoogleSignInProvider().logout();
                  Navigator.popAndPushNamed(context, LoginScreen.routename);
                });
              },
              child: const Text('Yes'),
            )
          ],
        )
      },
    ];
    DefaultCacheManager().emptyCache();
    super.initState();
  }

  @override
  void dispose() {
    DefaultCacheManager().emptyCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedFontSize: 15,
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 23.5),
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF843622),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home,
              color: Color(0xFFF8F8F8),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.solidBookmark,
              color: Color(0xFFF8F8F8),
            ),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.solidUserCircle,
              color: Color(0xFFF8F8F8),
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.signOutAlt,
              color: Color(0xFFF8F8F8),
            ),
            label: 'Log Out',
          ),
        ],
      ),
      body: tabs[_currentIndex]['page'],
    );
  }
}

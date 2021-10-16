import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './bottom_navigation_screen.dart';
import './login_screen.dart';

/// Root Widget which will Redirect the User to different Screens
/// according to its Login Status
class UserStateScreen extends StatefulWidget {
  @override
  _UserStateScreenState createState() => _UserStateScreenState();
}

class _UserStateScreenState extends State<UserStateScreen> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth userInstance = FirebaseAuth.instance;

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: userInstance.authStateChanges(),
        builder: (
          BuildContext context,
          AsyncSnapshot<Object?> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something Went Wrong!'),
            );
          } else if (snapshot.hasData) {
            return BottomNavigationScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}

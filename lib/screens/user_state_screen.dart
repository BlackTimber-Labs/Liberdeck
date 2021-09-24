import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './bottom_navigation_screen.dart';
import './login_screen.dart';

class UserStateScreen extends StatefulWidget {
  ///
  const UserStateScreen({Key? key}) : super(key: key);

  @override
  _UserStateScreenState createState() => _UserStateScreenState();
}

class _UserStateScreenState extends State<UserStateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
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

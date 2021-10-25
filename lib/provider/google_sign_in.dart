import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/bottom_navigation_screen.dart';
import '../screens/cousre_screen.dart';

/// Provider contains all the functions of the Google SignIn Method
class GoogleSignInProvider extends ChangeNotifier {
  /// Initialization of the GoogleSignIn
  final GoogleSignIn googleSignIn = GoogleSignIn();

  /// Function for LOGIN
  Future<void> googleLogIn(BuildContext context) async {
    final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();

    if (googleAccount != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          await FirebaseAuth.instance
              .signInWithCredential(
            GoogleAuthProvider.credential(
              idToken: googleAuth.idToken,
              accessToken: googleAuth.accessToken,
            ),
          )
              .then((UserCredential value) {
            if (value.additionalUserInfo!.isNewUser) {
              Navigator.of(context)
                  .pushReplacementNamed(CourseScreen.routename);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(BottomNavigationScreen.routename);
            }
          });
        } catch (e) {
          AlertDialog(
            content: Text(
              e.toString(),
            ),
            title: const Text('An Error Occured'),
          );
        }
        notifyListeners();
      }
    }
  }

  /// Function for LOGOUT
  Future<void> logout() async {
    // await googleSignIn.disconnect();
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}

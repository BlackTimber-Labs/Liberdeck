import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/bottom_navigation_screen.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  // GoogleSignInAccount? _user;
  //GoogleSignInAccount get user => _user!;

  Future googleLogIn(BuildContext context) async {
    // try {
    //   final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    //   if (googleUser == null) return;
    //   _user = googleUser;
    //   final GoogleSignInAuthentication googleAuth =
    //       await googleUser.authentication;

    //   final OAuthCredential credential = GoogleAuthProvider.credential(
    //     accessToken: googleAuth.accessToken,
    //     idToken: googleAuth.idToken,
    //   );
    //   await FirebaseAuth.instance.signInWithCredential(credential).then(
    //         (UserCredential value) => Navigator.of(context)
    //             .pushNamed(BottomNavigationScreen.routename),
    //       );
    // }
    //final googleSignIn = GoogleSignIn();
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
              .then(
                (UserCredential value) => Navigator.of(context)
                    .pushNamed(BottomNavigationScreen.routename),
              );
        } catch (e) {
          print(e.toString());
        }
        notifyListeners();
      }
    }
  }

  Future<void> logout() async {
    // await googleSignIn.disconnect();
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/bottom_navigation_screen.dart';

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
              .then(
                (UserCredential value) => Navigator.of(context)
                    .pushReplacementNamed(BottomNavigationScreen.routename),
              );
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

  // Future<String> name() async {
  //   final googleSignInAuthentication =
  //       await googleSignIn.currentUser!.authentication;
  //   final idToken = googleSignInAuthentication.idToken;
  //   parseJwt(String token) {
  //     // validate token

  //     final List<String> parts = token.split('.');

  //     // retrieve token payload
  //     final String payload = parts[1];
  //     final String normalized = base64Url.normalize(payload);
  //     final String resp = utf8.decode(base64Url.decode(normalized));
  //     // convert to Map
  //     final payloadMap = json.decode(resp);

  //     return payloadMap;
  //   }

  //   var idMap = parseJwt(idToken.toString());

  //   final String firstName = idMap["given_name"].toString();
  //   final String lastName = idMap["family_name"].toString();

  //   return firstName;
  // }
}

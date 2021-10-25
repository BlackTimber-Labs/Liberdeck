import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/google_sign_in.dart';

/// Root Widget of the Login Screen
class LoginScreen extends StatelessWidget {
  /// Routename of the Login Screen
  static const String routename = '/login_screen';
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: height * 0.6,
            child: HeaderSection(),
          ),
          InputFields(),
        ],
      ),
    );
  }
}

/// Header Section Widget of the Login screen
class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image.asset('assets/images/loginTopLeft.png'),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                children: const <Widget>[
                  Center(
                    child: Text(
                      'LIBERDECK',
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontSize: 51.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    'By BlackTimber Labs',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22.5,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Image.asset('assets/images/loginCenter2.png'),
        )
      ],
    );
  }
}

/// Input Button Widget
class InputFields extends StatefulWidget {
  @override
  _InputFieldsState createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      margin: const EdgeInsets.only(bottom: 70.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              final GoogleSignInProvider provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogIn(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xFFD6CAC4),
              ),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              shadowColor: MaterialStateProperty.all(Colors.black),
              elevation: MaterialStateProperty.all(8),
              fixedSize: MaterialStateProperty.all(const Size(50, 60)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 20.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/google.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(width: 15),
                const Text('Sign In With Google')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

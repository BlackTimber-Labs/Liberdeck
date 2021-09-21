import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../provider/google_sign_in.dart';


class LoginScreen extends StatelessWidget {
static const String routename = '/login_screen';
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: height* 0.5,
                width: width,
                child: HeaderSection(),
              ),
              SizedBox(height: 30),
              InputFields(),
            ],
          ),
        )
    );
  }
}

class HeaderSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset('assets/images/loginTopLeft.png'),
        Padding(
          padding: EdgeInsets.fromLTRB(60, 81, 0,0),
          child: Text('LIBERDECK',
            style: TextStyle(
              letterSpacing: 1.5,
              fontSize: 51.0, fontWeight: FontWeight.w700,
            ),),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(80, 150, 0,0),
          child: Text('By BlackTimber Labs',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22.5,
              letterSpacing: 1.5,
            ),
          ),
        ),
        Positioned(
            child: Container(
              alignment: Alignment.bottomCenter,
                child: Image.asset('assets/images/loginCenter2.png')),

        )

      ],
    );
  }
}

class InputFields extends StatefulWidget {


  @override
  _InputFieldsState createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    final width= MediaQuery.of(context).size.width;
    final height= MediaQuery.of(context).size.height;

    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(child: Text('Login',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 40),
          )),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed:() {
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogIn(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xFFD6CAC4)),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              shadowColor:MaterialStateProperty.all(Colors.black) ,
              elevation:MaterialStateProperty.all(8) ,
              fixedSize: MaterialStateProperty.all(Size(50,60)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              textStyle: MaterialStateProperty.all(TextStyle(
                  fontSize: 20.0)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  Image.asset('assets/images/google.png', height: 50, width: 50,),
                  SizedBox(width: 15),
                  Text('Sign In With Google')
                ],
              ),
            ),
          ),
          // SizedBox(height: 60),
          // ElevatedButton(
          //   onPressed:(){},
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(Color(0xFFC4C4C4)),
          //     foregroundColor: MaterialStateProperty.all(Colors.black),
          //     fixedSize: MaterialStateProperty.all(Size(50,60)),
          //     shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          //     textStyle: MaterialStateProperty.all(TextStyle(
          //         fontSize: 20.0)),
          //   ),
          //   child: Padding(
          //     padding: EdgeInsets.only(left: 40),
          //     child: Row(
          //       children: [
          //         Image.asset('assets/images/outlook.png', height: 50, width: 50,),
          //         SizedBox(width: 15),
          //         Text('Sign In With Outlook')
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: 195),
          // Center(
          //   child: Text('A SoftDodge Product',
          //     style: TextStyle(
          //         fontSize: 22.0
          //     ),
          //   ),
          // ),

        ]
    ),
      );
  }
}


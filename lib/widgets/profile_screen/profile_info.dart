import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../screens/about_screen.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    final User user = FirebaseAuth.instance.currentUser!;

    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 30, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // const Text(
          //   'INFORMATION',
          //   style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.w600),
          // ),
          // SizedBox(height: 20),
          // Row(
          //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: const <Widget>[
          //      Text(
          //       'BRANCH :',
          //       style: TextStyle(
          //       fontSize: 19.5, fontWeight: FontWeight.w500),
          //     ),
          //    SizedBox(width: 80),
          //     Text(
          //       ' CSE',
          //       style: TextStyle(
          //           fontSize: 19.5,
          //           fontWeight: FontWeight.w500,
          //           color: Color(0xFFC95A2B)),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 20),
          // Row(
          //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: const <Widget>[
          //     Text(
          //       'YEAR :',
          //       style: TextStyle(
          //       fontSize: 19.5, fontWeight: FontWeight.w500),
          //     ),
          //     SizedBox(width: 110),
          //     Text(
          //       ' 2nd',
          //       style: TextStyle(
          //           fontSize: 19.5,
          //           fontWeight: FontWeight.w500,
          //           color: Color(0xFFC95A2B)),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 20),
          // Row(
          //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children:const  <Widget>[
          //     Text(
          //       'SEMESTER :',
          //       style: TextStyle(
          //       fontSize: 19.5, fontWeight: FontWeight.w500),
          //     ),
          //     SizedBox(width: 60),
          //     Text(
          //       ' 3rd',
          //       style: TextStyle(
          //           fontSize: 19.5,
          //           fontWeight: FontWeight.w500,
          //           color: Color(0xFFC95A2B)),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 30.0),
          // Divider(thickness: 1.0, color: Color(0xFF843622)),
          // SizedBox(height: 30.0),
          const Text(
            'ACCOUNT',
            style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                'NAME :',
                style: TextStyle(fontSize: 21.5, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 38),
              Expanded(
                child: Text(
                  user.displayName!.toUpperCase(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 21.5,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFC95A2B),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                'EMAIL :',
                style: TextStyle(fontSize: 21.5, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 35),
              Expanded(
                child: Text(
                  user.email!,
                  maxLines: 3,
                  style: const TextStyle(
                    fontSize: 21.5,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFC95A2B),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Center(
            child: TextButton(
              child: const Text(
                'About developers',
                style: TextStyle(fontSize: 19.5, color: Color(0xFF000000)),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AboutScreen.routename);
              },
            ),
          ),
        ],
      ),
    );
  }
}

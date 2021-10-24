import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../screens/bottom_navigation_screen.dart';

class OptionsTile extends StatefulWidget {
  const OptionsTile({
    required this.name,
    required this.colour,
    required this.semID,
  });

  final Color colour;
  final String name;
  final int semID;

  @override
  _OptionsTileState createState() => _OptionsTileState();
}

class _OptionsTileState extends State<OptionsTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(15),
        elevation: 5,
        child: InkWell(
          onTap: () {
            FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .update(
              <String, Object?>{
                'semID': widget.semID,
                'semester': widget.name,
              },
            ).whenComplete(() {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Semester Changed'),
                  duration: Duration(seconds: 1),
                ),
              );
            });
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => BottomNavigationScreen(),
              ),
              (route) => false,
            );
          },
          child: Container(
            width: 100,
            padding: const EdgeInsets.only(left: 20, right: 20),
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            //decoration: BoxDecoration(color: Colors.grey),
            child: Row(
              children: [
                Icon(
                  Icons.check,
                  color: widget.colour,
                  size: 30,
                ),
                const SizedBox(
                  width: 30,
                ),
                Center(
                  child: Text(
                    widget.name,
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

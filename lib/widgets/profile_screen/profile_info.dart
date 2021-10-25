import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../screens/semester_selection_screen.dart';

import 'account_tile.dart';
import 'informatoin_tile.dart';

/// Root Widget of the Profile Screen's Widget
class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    //final UserModel user = Provider.of<UserProvider>(context).user;
    final User userCred = FirebaseAuth.instance.currentUser!;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.03,
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(userCred.uid)
            .get(),
        builder: (
          BuildContext context,
          snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final String course = snapshot.data!.get('course').toString();
            final String department =
                snapshot.data!.get('department').toString();
            final String sem = snapshot.data!.get('semester').toString();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'INFORMATION',
                  style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.w600),
                ),
                const Divider(thickness: 1.0, color: Color(0xFF843622)),
                const SizedBox(height: 20),
                InformationTile(
                  leading: 'COURSE :',
                  onTap: () {
                    // Navigator.of(context)
                    //     .pushNamed(CourseSelectionScreen.routename);
                  },
                  title: course,
                ),
                InformationTile(
                  leading: 'DEPARTMENT :',
                  onTap: () {},
                  title: department,
                ),
                InformationTile(
                  leading: 'SEMESTER :',
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(SemesterSelectionScreen.routename);
                  },
                  title: sem,
                ),
                const Divider(thickness: 1.0, color: Color(0xFF843622)),
                const Text(
                  'ACCOUNT',
                  style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                AccountTile(
                  title: userCred.displayName!.toUpperCase(),
                  leading: 'Name :',
                ),
                AccountTile(
                  title: userCred.email!.toLowerCase(),
                  leading: 'Email :',
                ),
              ],
            );
          } else {
            return const Center(
              child: Text(
                'An Error Occured',
              ),
            );
          }
        },
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liberdeck/screens/course_selection_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user.dart';

import '../../provider/user_provider.dart';

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
      child: StreamBuilder<SharedPreferences>(
          stream: SharedPreferences.getInstance().asStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final course = snapshot.data!.getString('course');
              final department = snapshot.data!.getString('department');
              final sem = snapshot.data!.getString('semester');
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'INFORMATION',
                    style:
                        TextStyle(fontSize: 22.5, fontWeight: FontWeight.w600),
                  ),
                  const Divider(thickness: 1.0, color: Color(0xFF843622)),
                  const SizedBox(height: 20),
                  InformationTile(
                    leading: 'COURSE :',
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(CourseSelectionScreen.routename);
                    },
                    title: course ?? 'Course',
                  ),
                  InformationTile(
                    leading: 'DEPARTMENT :',
                    onTap: () {},
                    title: department ?? 'Department',
                  ),
                  InformationTile(
                    leading: 'SEMESTER :',
                    onTap: () {},
                    title: sem ?? 'Semester',
                  ),
                  const Divider(thickness: 1.0, color: Color(0xFF843622)),
                  const Text(
                    'ACCOUNT',
                    style:
                        TextStyle(fontSize: 22.5, fontWeight: FontWeight.w600),
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
            }
          }),
    );
  }
}

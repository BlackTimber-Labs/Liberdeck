import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final UserModel user = Provider.of<UserProvider>(context).user;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.03,
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'INFORMATION',
            style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.w600),
          ),
          const Divider(thickness: 1.0, color: Color(0xFF843622)),
          const SizedBox(height: 20),
          InformationTile(
            leading: 'BRANCH :',
            onTap: () {},
            title: user.course,
          ),
          InformationTile(
            leading: 'DEPARTMENT :',
            onTap: () {},
            title: user.department,
          ),
          InformationTile(
            leading: 'SEMESTER :',
            onTap: () {},
            title: user.sem,
          ),
          const Divider(thickness: 1.0, color: Color(0xFF843622)),
          const Text(
            'ACCOUNT',
            style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          AccountTile(
            title: user.name.toUpperCase(),
            leading: 'Name :',
          ),
          AccountTile(
            title: user.email,
            leading: 'Email :',
          ),
        ],
      ),
    );
  }
}

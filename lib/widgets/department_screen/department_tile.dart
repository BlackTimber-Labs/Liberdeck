import 'package:flutter/material.dart';
import 'package:liberdeck/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../../screens/semester_screen.dart';

class DepartmentTile extends StatelessWidget {
  const DepartmentTile({
    required this.name,
    required this.colour,
    required this.departmentID,
    required this.ctx,
  });
  final Color colour;
  final String name;
  final String departmentID;
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          SemesterScreen.routename,
          arguments: departmentID,
        );
        Provider.of<UserProvider>(ctx, listen: false).addDepartment(
          name,
          departmentID,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 27),
        height: 55,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Text(
              name,
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ),
      ),
    );
  }
}

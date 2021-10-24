import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';

import '../../screens/semester_screen.dart';

/// Widget of the Department Screen to Display the Name of the Department.
class DepartmentTile extends StatelessWidget {
  /// Constructor
  const DepartmentTile({
    required this.name,
    required this.color,
    required this.departmentID,
    required this.ctx,
    required this.courseID,
  });

  /// BackgroundColor of the Widget.
  final Color color;

  /// Name of the Department.
  final String name;

  /// DepartmentID for the adding it on the User Profile.
  final String departmentID;

  final String courseID;

  /// Context of the Department Screen for the User Provider.
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    final UserProvider user = Provider.of<UserProvider>(ctx);
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          SemesterScreen.routename,
          arguments: SemesterScreenArgs(
            departmentID: departmentID,
            courseID: courseID,
          ),
        );
        user.addDepartment(
          name,
          departmentID,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 27),
        height: 55,
        decoration: BoxDecoration(
          color: color,
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';

import '../../screens/bottom_navigation_screen.dart';

/// Widget of the Semester Screen to Display the Name of the Semester.
class SemesterTile extends StatelessWidget {
  /// Constructor
  const SemesterTile({
    required this.sem,
    required this.departmentID,
    required this.semID,
    required this.ctx,
  });

  /// Name of the Semester
  final String sem;

  /// Semester ID
  final int semID;

  /// Department ID
  final String departmentID;

  /// Context of the Semester Screeen for User Provider
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              BottomNavigationScreen.routename,
              // arguments: SubScreenArguments(
              //   'btech',
              //   departmentID,
              //   semID,
              // ),
            );
            Provider.of<UserProvider>(ctx, listen: false).addSemester(
              semID,
              sem,
            );
          },
          child: Container(
            width: width * 0.6,
            height: 71,
            decoration: BoxDecoration(
              color: const Color(0xFFC45628),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(
              child: Text(
                sem,
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

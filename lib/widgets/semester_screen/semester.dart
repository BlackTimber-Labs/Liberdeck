import 'package:flutter/material.dart';

import '../../screens/sub_screen.dart';

class Semester extends StatefulWidget {
  const Semester({
    required this.sem,
    required this.departmentID,
    required this.semID,
  });
  final String sem;
  final int semID;
  final String departmentID;

  @override
  _SemesterState createState() => _SemesterState();
}

class _SemesterState extends State<Semester> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              SubScreen.routename,
              arguments: SubScreenArguments(
                'btech',
                widget.departmentID,
                widget.semID,
              ),
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
                widget.sem,
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

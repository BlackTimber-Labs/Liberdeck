import 'package:flutter/material.dart';

import '../../screens/semester_screen.dart';

class Department extends StatefulWidget {
  const Department(
   { required this.name,
    required this.colour,
    required this.departmentID,}
  );
  final Color colour;
  final String name;
  final String departmentID;

  @override
  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          SemesterScreen.routename,
          arguments: widget.departmentID,
        );
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 27),
        height: 55,
        width: 380,
        decoration: BoxDecoration(
            color: widget.colour, borderRadius: BorderRadius.circular(7)),
        child: Center(
          child: Text(
            widget.name,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
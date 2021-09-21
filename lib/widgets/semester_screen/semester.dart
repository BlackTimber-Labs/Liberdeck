import 'package:flutter/material.dart';

import '../../screens/sub_screen.dart';

class Semester extends StatefulWidget {
  Semester({
    required this.sem,
    required this.departmentID,
    required this.semID,
  });
  final String sem;
  final int semID;
  final String departmentID;
  // final String sem2;

  @override
  _SemesterState createState() => _SemesterState();
}

class _SemesterState extends State<Semester> {
  @override
  Widget build(BuildContext context) {
    final width= MediaQuery.of(context).size.width;
    final height= MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
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
                color: Color(0xFFC45628),
                borderRadius: BorderRadius.circular(7)),
            child: Center(
              child: Text(
                widget.sem,
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
          // TextButton(
          //   onPressed: () {
          //     setState(() {});
          //   },
          //   child: Container(
          //     width: 150,
          //     height: 71,
          //     decoration: BoxDecoration(
          //       color: Color(0xFFEE6830),
          //       borderRadius: BorderRadius.circular(7),
          //     ),
          //     child: Center(
          //         child: Text(widget.sem2,
          //             style: TextStyle(
          //                 fontSize: 30,
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.w500,
          //                 letterSpacing: 1))),
          //   ),
          // )
        ),
      ],
    );
  }
}

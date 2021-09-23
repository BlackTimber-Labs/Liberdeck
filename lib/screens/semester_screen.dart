import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/semester.dart' as sem_model;

import '../provider/semester_provider.dart';

import '../widgets/semester_screen/semester.dart' as sem_widget;

class SemesterScreen extends StatefulWidget {
  static const String routename = '/semester_screen';
  @override
  _SemesterScreenState createState() => _SemesterScreenState();
}

class _SemesterScreenState extends State<SemesterScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final Object? departmentId = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/images/semester_screen_top_right.png'),
                alignment: Alignment.topRight,
              ),
            ),
          ),
          const Center(
            child: Text(
              'Select your Semester',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.7,
            child: Consumer<SemesterProvider>(
              builder: (
                BuildContext context,
                SemesterProvider sem,
                Widget? child,
              ) {
                final List<sem_model.Semester> semesterList = sem.findSemester(
                  'btech',
                  departmentId.toString(),
                );
                return ListView.builder(
                  itemBuilder: (
                    BuildContext ctx,
                    int i,
                  ) {
                    return sem_widget.Semester(
                      sem: semesterList[i].title,
                      departmentID: semesterList[i].departmentID,
                      semID: semesterList[i].id,
                    );
                  },
                  itemCount: semesterList.length,
                );
              },
            ),
          ),
          BN(),
        ],
      ),
    );
  }
}

class BN extends StatefulWidget {
  @override
  _BNState createState() => _BNState();
}

class _BNState extends State<BN> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 55,
            width: 132,
            decoration: BoxDecoration(
              color: const Color(0xFF843622),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                'Back',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        // TextButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, SubScreen.routename);
        //   },
        //   child: Container(
        //     height: 55,
        //     width: 132,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(15),
        //       color: const Color(0xFF843622),
        //     ),
        //     child: const Center(
        //       child: Text(
        //         'Next',
        //         style: TextStyle(
        //           fontSize: 32,
        //           fontWeight: FontWeight.w600,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

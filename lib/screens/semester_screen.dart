import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/semester.dart' as sem_model;

import '../provider/semester_provider.dart';

import '../widgets/back_button.dart';
import '../widgets/semester_screen/semester_tile.dart' as sem_widget;

/// Root Widget of the Semester Screen
class SemesterScreen extends StatefulWidget {
  /// Routename of the Semester Screen
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
                return semesterList.isEmpty
                    ? const Center(child: Text('Coming Soon '))
                    : ListView.builder(
                        itemBuilder: (
                          BuildContext ctx,
                          int i,
                        ) {
                          return sem_widget.SemesterTile(
                            sem: semesterList[i].title,
                            departmentID: semesterList[i].departmentID,
                            semID: semesterList[i].id,
                            ctx: context,
                          );
                        },
                        itemCount: semesterList.length,
                      );
              },
            ),
          ),
          BackButtonWidget(),
        ],
      ),
    );
  }
}

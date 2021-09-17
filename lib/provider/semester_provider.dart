import 'package:flutter/material.dart';

import '../model/semester.dart';

/// Semester Provider contains the List of the semesters and
/// all the functions require.
class SemesterProvider with ChangeNotifier {
  final List<Semester> _semesterList = <Semester>[
    Semester(
      title: '1st Semester',
      courseName: 'B.tech',
      sem: 1,
      departmentName: 'Information Technology',
    ),
  ];

  /// Getter to make a copy of the List.
  List<Semester> get semesterList => _semesterList;

  /// Function to showcase the final list of Semester department wise.
  List<Semester> findSemester(
    String courseName,
    String departmentName,
  ) {
    final List<Semester> finalSemesterList = semesterList
        .where(
          (Semester element) =>
              element.courseName
                  .toLowerCase()
                  .contains(courseName.toLowerCase()) &&
              element.departmentName
                  .toLowerCase()
                  .contains(departmentName.toLowerCase()),
        )
        .toList();
    return finalSemesterList;
  }
}

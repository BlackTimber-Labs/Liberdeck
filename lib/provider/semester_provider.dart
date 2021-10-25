import 'package:flutter/material.dart';

import '../model/semester.dart';

/// Semester Provider contains the List of the semesters and
/// all the functions require.
class SemesterProvider with ChangeNotifier {
  final List<Semester> _semesterList = <Semester>[];

  /// Getter to make a copy of the List.
  List<Semester> get semesterList => _semesterList;

  /// Function to showcase the final list of Semester department wise.
  List<Semester> findSemester(
    String courseID,
    String departmentID,
  ) {
    final List<Semester> finalSemesterList = semesterList
        .where(
          (Semester element) =>
              element.courseID.toLowerCase().contains(courseID.toLowerCase()) &&
              element.departmentID
                  .toLowerCase()
                  .contains(departmentID.toLowerCase()),
        )
        .toList();
    return finalSemesterList;
  }
}

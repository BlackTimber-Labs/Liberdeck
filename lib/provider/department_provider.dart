import 'package:flutter/material.dart';

import '../model/department.dart';

/// Department Provider contains the List of all departments and
/// all the functions require.
class DepartmentProvider with ChangeNotifier {
  final List<Department> _departmentList = <Department>[
    Department(
      title: 'First Year',
      courseID: 'btech',
      id: 'fy',
    ),
    Department(
      title: 'Information Technology',
      courseID: 'btech',
      id: 'it',
    ),
    Department(
      title: 'Computer Science Engineering',
      courseID: 'btech',
      id: 'cse',
    ),
    Department(
      title: 'Mechanical Engineering',
      courseID: 'btech',
      id: 'me',
    ),
    Department(
      title: 'Chemical Engineering',
      courseID: 'btech',
      id: 'ce',
    ),
    Department(
      title: 'Data Science Engineering',
      courseID: 'btech',
      id: 'dse',
    ),
    Department(
      title: 'Computer and Communication Engineering',
      courseID: 'btech',
      id: 'cce',
    ),
    Department(
      title: 'Electrical Engineering',
      courseID: 'btech',
      id: 'ee',
    ),
    Department(
      title: 'Electrical and Electronics Engineering',
      courseID: 'btech',
      id: 'eee',
    ),
  ];

  /// Getter to make a copy of the List.
  List<Department> get departmentList => _departmentList;

  /// Function to showcase the final list of Department course wise.
  List<Department> findDepartment(String courseID) {
    final List<Department> finalDepartmentList = departmentList
        .where(
          (Department element) => element.courseID.toLowerCase().contains(
                courseID.toLowerCase(),
              ),
        )
        .toList();
    return finalDepartmentList;
  }
}

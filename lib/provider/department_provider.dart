import 'package:flutter/material.dart';

import '../model/department.dart';

/// Department Provider contains the List of all departments and
/// all the functions require.
class DepartmentProvider with ChangeNotifier {
  final List<Department> _departmentList = <Department>[
    Department(
      title: 'Information Technology',
      courseName: 'B.Tech',
    ),
  ];

  /// Getter to make a copy of the List.
  List<Department> get departmentList => _departmentList;

  /// Function to showcase the final list of Department course wise.
  List<Department> findDepartment(String course) {
    final List<Department> finalDepartmentList = departmentList
        .where(
            (Department element) => element.courseName.toLowerCase().contains(
                  course.toLowerCase(),
                ))
        .toList();
    return finalDepartmentList;
  }
}

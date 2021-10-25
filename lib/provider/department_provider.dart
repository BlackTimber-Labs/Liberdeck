import 'package:flutter/material.dart';

import '../model/department.dart';

/// Department Provider contains the List of all departments and
/// all the functions require.
class DepartmentProvider with ChangeNotifier {
  final List<Department> _departmentList = <Department>[];

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

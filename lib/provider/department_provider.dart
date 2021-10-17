import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/department.dart';

/// Department Provider contains the List of all departments and
/// all the functions require.
class DepartmentProvider with ChangeNotifier {
  final List<Department> _departmentList = <Department>[
    // Department(
    //   title: 'First Year',
    //   courseID: 'btech',
    //   id: 'fy',
    // ),
    // Department(
    //   title: 'IT',
    //   courseID: 'btech',
    //   id: 'it',
    // ),
    // Department(
    //   title: 'CSE',
    //   courseID: 'btech',
    //   id: 'cse',
    // ),
    // Department(
    //   title: 'ME',
    //   courseID: 'btech',
    //   id: 'me',
    // ),
    // Department(
    //   title: 'CE',
    //   courseID: 'btech',
    //   id: 'ce',
    // ),
    // Department(
    //   title: 'DSE',
    //   courseID: 'btech',
    //   id: 'dse',
    // ),
    // Department(
    //   title: 'CCE',
    //   courseID: 'btech',
    //   id: 'cce',
    // ),
    // Department(
    //   title: 'EE',
    //   courseID: 'btech',
    //   id: 'ee',
    // ),
    // Department(
    //   title: 'EEE',
    //   courseID: 'btech',
    //   id: 'eee',
    // ),
  ];

  /// Getter to make a copy of the List.
  List<Department> get departmentList => _departmentList;

  // Future<void> departmentListFx() async {
  //   final list = await FirebaseFirestore.instance
  //       .collection('courses')
  //       .doc()
  //       .get()
  //       .then((value) {
  //     departmentList.insert(
  //         0,
  //         Department(
  //             title: value.data()![""].toString(),
  //             courseID: value.data()![""].toString(),
  //             id: value.data()![""].toString()));
  //   });
  // }

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

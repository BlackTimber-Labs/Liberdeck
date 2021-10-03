import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class UserProvider with ChangeNotifier {
  final UserModel _user = UserModel(
    uid: 'uid',
    name: 'name',
    email: 'email',
    course: 'course',
    department: 'department',
    sem: 'sem',
    courseID: 'courseID',
    departmentID: 'departmentID',
    semID: 0,
  );
  UserModel get user {
    return _user;
  }

  final User userInstance = FirebaseAuth.instance.currentUser!;

  Future<void> addCourse(
    String course,
    String courseID,
  ) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userInstance.uid)
        .set(<String, dynamic>{
      'uid': userInstance.uid,
      'name': userInstance.displayName,
      'email':userInstance.email,
      'course': course,
      'courseID': courseID,
    });
  }

  Future<void> addDepartment(
    String department,
    String departmentID,
  ) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userInstance.uid)
        .update(<String, Object?>{
      'department': department,
      'departmentID': departmentID,
    });
  }

  Future<void> addSemester(
    int semID,
    String semester,
  ) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userInstance.uid)
        .update(<String, Object?>{
      'semID': semID,
      'semester': semester,
    });
  }

  UserModel userData(
    String name,
    String uid,
    String email,
    String course,
    String courseID,
    String department,
    String departmentID,
    String sem,
    int semID,
  ) {
    user.name = name;
    user.uid = uid;
    user.email = email;
    user.course = course;
    user.courseID = courseID;
    user.department = department;
    user.departmentID = departmentID;
    user.sem = sem;
    user.semID = semID;
    notifyListeners();
    return user;
  }
}

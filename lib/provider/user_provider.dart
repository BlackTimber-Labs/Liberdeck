import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

///User provider class containing all the required functions.
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

  /// Getter of the user
  UserModel get user {
    return _user;
  }

  /// User data of Login User
  final User userInstance = FirebaseAuth.instance.currentUser!;

  /// Function to add the course and courseID in the User Profile
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
      'email': userInstance.email,
      'course': course,
      'courseID': courseID,
    });
  }

  /// Function to add the department and departmentID in the User Profile
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

  /// Function to add the semester and semesterID in the User Profile
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

  /// Function to Assign the User Data in the local user Instance.
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

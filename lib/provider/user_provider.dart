import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

///User provider class containing all the required functions.
class UserProvider with ChangeNotifier {
  final UserModel user = UserModel(
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

  /// User data of Login User
  final User userInstance = FirebaseAuth.instance.currentUser!;

  /// Function to add the course and courseID in the User Profile
  void addCourse(
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
    user.course = course;
    user.courseID = courseID;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('course', course);
    await prefs.setString('courseID', courseID);
    print('${prefs.getString('courseID')}p');
    //LocalData.addCourse(course, courseID);
  }

  /// Function to add the department and departmentID in the User Profile
  void addDepartment(
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
    user.department = department;
    user.departmentID = departmentID;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('department', department);
    await prefs.setString('departmentID', departmentID);
    print('${prefs.getString('departmentID')}p');
  }

  /// Function to add the semester and semesterID in the User Profile
  void addSemester(
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
    user.sem = semester;
    user.semID = semID;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('semester', semester);
    await prefs.setInt('semID', semID);
    print('${prefs.getInt('semID')}p');
  }
}

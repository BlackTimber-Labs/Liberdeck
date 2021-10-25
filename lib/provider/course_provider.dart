import 'package:flutter/material.dart';

import '../model/course.dart';

/// Course Provider containing the List of all the courses.
class CourseProvider with ChangeNotifier {
  final List<Cousre> _courseList = <Cousre>[];

  /// Getter to make a copy of the List.
  List<Cousre> get courseList => _courseList;
}

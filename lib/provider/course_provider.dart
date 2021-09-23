import 'package:flutter/material.dart';

import '../model/course.dart';

/// Course Provider containing the List of all the courses.
class CourseProvider with ChangeNotifier {
  final List<Cousre> _courseList = <Cousre>[
    Cousre(
      title: 'B.Tech',
      id: 'btech',
    ),
  ];

  /// Getter to make a copy of the List.
  List<Cousre> get courseList => _courseList;
}

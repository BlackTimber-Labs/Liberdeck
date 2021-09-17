import './semester.dart';

/// These are the details each Department contain.
class Department {
  ///Constructor
  Department({
    required this.title,
    required this.sems,
  });

  /// Title of the course (Ex=> Information Technology)
  String title;

  /// List of the semesters in each course
  List<Semester> sems;
}

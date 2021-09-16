import './department.dart';

/// These are the details each Course contain.
class Course {
  ///Constructor
  Course({
    required this.title,
    required this.departments,
  });

  /// Title of the Course (Ex=> B.Tech)
  String title;

  /// List of Departments each course will have.
  List<Department> departments;
}

/// These are details each Subject Contain.
class Subject {
  ///Constructor
  Subject({
    required this.title,
    required this.sem,
    required this.departmentName,
    required this.courseName,
  });

  /// Subject title (Ex=> MA2101)
  String title;
  /// The no. of Semester
  int sem;
  /// Name of the Department
  String departmentName;
  /// Name of the Course
  String courseName;
}

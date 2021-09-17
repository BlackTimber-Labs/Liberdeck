///These are the details each semester contain.
class Semester {
  ///Constructor
  Semester({
    required this.sem,
    required this.title,
    required this.courseName,
    required this.departmentName,
  });

  /// No. of the semester (Ex=>1)
  int sem;

  /// Title of the semester (Ex=> 1st Semester)
  String title;

  /// Name of the Cousre
  String courseName;

  /// Name of the Department
  String departmentName;
}

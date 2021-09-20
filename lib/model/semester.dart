///These are the details each semester contain.
class Semester {
  ///Constructor
  Semester({
    required this.id,
    required this.title,
    required this.courseID,
    required this.departmentID,
  });

  /// No. of the semester (Ex=>1)
  int id;

  /// Title of the semester (Ex=> 1st Semester)
  String title;

  /// ID of the Course
  String courseID;

  /// ID of the Department
  String departmentID;
}

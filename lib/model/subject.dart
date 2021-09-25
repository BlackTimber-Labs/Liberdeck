/// These are details each Subject Contain.
class Subject {
  ///Constructor
  Subject({
    required this.title,
    required this.semID,
    required this.departmentID,
    required this.courseID,
    required this.id,
    required this.name, 
  });

  /// Subject title (Ex=> MA2101)
  String title;

  /// The no. of Semester
  int semID;

  /// ID of the Department
  String departmentID;

  /// ID of the Course
  String courseID;

  /// ID of the Subject (Ex=> ma2101)
  String id;

  /// Name of the Subject
  String name;
}

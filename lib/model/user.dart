/// Model for user profile data
class UserModel {
  /// Constructor
  UserModel(
      {required this.uid,
      required this.name,
      required this.course,
      required this.department,
      required this.sem,
      required this.courseID,
      required this.departmentID,
      required this.semID});

  /// Name of the user
  String name;

  /// Course of the user
  String course;

  /// CourseID of the user
  String courseID;

  /// Department of the user
  String department;

  /// DepartmentID of the user
  String departmentID;

  /// Semester of the user
  String sem;

  /// SemesterID of the user
  int semID;

  /// UserID of the user
  String uid;
}

/// These are the details each Department contain.
class Department {
  ///Constructor
  Department({
    required this.title,
    required this.courseID,
    required this.id,
  });

  /// Title of the Department (Ex=> Information Technology)
  String title;

  /// ID of the Cousre
  String courseID;

  /// ID of the Department (Ex=> it)
  String id;
}

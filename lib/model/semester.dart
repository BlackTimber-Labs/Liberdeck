import './subject.dart';
///These are the details each semester contain. 
class Semester {
  ///Constructor
  Semester({
    required this.title,
    required this.subjects,
  });
  /// Title of the semester (Ex=> 1)
  String title;
  /// This the list of subjects in each semester.
  List<Subject> subjects;
}

import './book.dart';
/// These are details each Subject Contain.
class Subject {
  ///Constructor
  Subject({
    required this.title,
    required this.books,
  });
  /// Subject title (Ex=> MA2101)
  String title;
  /// List of Books each Subject will have.
  List<Book> books;
}

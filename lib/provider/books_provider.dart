import 'package:flutter/material.dart';
import '../model/book.dart';

/// Book Data Provider containing the list of the books and all the
/// functions requires
class BooksProvider with ChangeNotifier {
  final List<Book> _bookList = [
    Book(
      author: "",
      courseID: "",
      departmentID: "",
      downloadUrl: "",
      id: "",
      imgUrl: "",
      sem: 1,
      subID: "",
      title: "",
      viewUrl: "",
      saveStatus: false,
    ),
  ];

  /// Getter to make a copy of the List.
  List<Book> get bookList {
    return _bookList;
  }

  /// Function to add book to the list
  void addBook(Book book) {
    bookList.add(book);
    notifyListeners();
  }

  /// Function to showcase the final list of the book semester wise.
  List<Book> findBook(
    String courseID,
    String departmentID,
    int sem,
    String subID,
  ) {
    final List<Book> finalbookList = bookList
        .where(
          (Book element) =>
              (element.courseID
                  .toLowerCase()
                  .contains(courseID.toLowerCase())) &&
              (element.departmentID
                  .toLowerCase()
                  .contains(departmentID.toLowerCase())) &&
              (element.subID.toLowerCase().contains(subID.toLowerCase())) &&
              element.sem == sem,
        )
        .toList();
    return finalbookList;
  }
}

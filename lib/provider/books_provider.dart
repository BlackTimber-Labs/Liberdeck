import 'package:flutter/material.dart';
import '../model/book.dart';

/// Book Data Provider containing the list of the books and all the
/// functions requires
class BooksProvider with ChangeNotifier {
  final List<Book> _bookList = <Book>[
    Book(
      id: '1',
      title: 'MATHS',
      author: 'ME',
      imgUrl: 'imgUrl',
      viewUrl: 'viewUrl',
      downloadUrl: 'downloadUrl',
      courseName: 'B.Tech',
      departmentName: 'IT',
      sem: 1,
      subName: 'MA2101',
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
    String courseName,
    String departmentName,
    int sem,
    String subName,
  ) {
    final List<Book> finalbookList = bookList
        .where(
          (Book element) =>
              (element.courseName
                  .toLowerCase()
                  .contains(courseName.toLowerCase())) &&
              (element.departmentName
                  .toLowerCase()
                  .contains(departmentName.toLowerCase())) &&
              (element.subName.toLowerCase().contains(subName.toLowerCase())) &&
              element.sem == sem,
        )
        .toList();
    return finalbookList;
  }
}

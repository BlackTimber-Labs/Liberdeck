import 'package:flutter/material.dart';

import '../model/book.dart';

/// Book Data Provider containing the list of the books and all the
/// functions requires
class BooksProvider with ChangeNotifier {
  final List<Book> _bookList = [
    Book(
      author: 'Michelle Obama',
      courseID: 'Biography',
      departmentID: '',
      downloadUrl: '',
      id: '1',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/IMG_20210917_201016.jpg',
      sem: 1,
      subID: '',
      title: 'Becoming',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/basic-civil-engineering-s-s-bhavikatti.pdf',
    ),
    Book(
      author: 'Michelle Obama',
      courseID: 'Biography',
      departmentID: '',
      downloadUrl: '',
      id: '2',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/IMG_20210917_201016.jpg',
      sem: 1,
      subID: '',
      title: 'Becoming',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/basic-civil-engineering-s-s-bhavikatti.pdf',
    ),
    Book(
      author: 'Michelle Obama',
      courseID: 'Biography',
      departmentID: '',
      downloadUrl: '',
      id: '3',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/IMG_20210917_201016.jpg',
      sem: 1,
      subID: '',
      title: 'Becoming',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/basic-civil-engineering-s-s-bhavikatti.pdf',
    ),
    Book(
      author: 'Michelle Obama',
      courseID: 'Biography',
      departmentID: '',
      downloadUrl: '',
      id: '4',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/IMG_20210917_201016.jpg',
      sem: 1,
      subID: '',
      title: 'Becoming',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/basic-civil-engineering-s-s-bhavikatti.pdf',
    ),
    Book(
      author: 'Michelle Obama',
      courseID: 'Biography',
      departmentID: '',
      downloadUrl: '',
      id: '5',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/IMG_20210917_201016.jpg',
      sem: 1,
      subID: '',
      title: 'Becoming',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/basic-civil-engineering-s-s-bhavikatti.pdf',
    ),
    Book(
      author: 'Michelle Obama',
      courseID: 'Biography',
      departmentID: '',
      downloadUrl: '',
      id: '6',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/IMG_20210917_201016.jpg',
      sem: 1,
      subID: '',
      title: 'Becoming',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/basic-civil-engineering-s-s-bhavikatti.pdf',
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

  /// Function to change the save status of the book.
  void changeStatus(Book book) {
    book.saveStatus = !book.saveStatus;
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

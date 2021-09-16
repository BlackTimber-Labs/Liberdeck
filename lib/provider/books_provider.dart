import 'package:flutter/material.dart';
import '../model/book.dart';

class BooksProvider with ChangeNotifier {
  final List<Book> _bookList = [];

  List<Book> get bookList {
    return _bookList;
  }

  void addBook(Book book) {
    
    bookList.add(book);
    notifyListeners();
  }
}

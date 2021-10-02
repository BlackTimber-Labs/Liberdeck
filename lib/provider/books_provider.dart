import 'package:flutter/material.dart';
import '../model/book.dart';

// ignore: public_member_api_docs
class BooksProvider with ChangeNotifier {
  // ignore: always_specify_types
  final List<Book> _bookList = [];

  // ignore: public_member_api_docs
  List<Book> get bookList {
    return _bookList;
  }

  // ignore: public_member_api_docs
  void addBook(Book book) {
    bookList.add(book);
    notifyListeners();
  }
}

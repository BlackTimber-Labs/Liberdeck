import 'package:flutter/material.dart';

import '../model/saved_book.dart';

class SavedBooksProvider with ChangeNotifier {
  final List<SavedBook> _bookList = <SavedBook>[];

  List<SavedBook> get bookList => _bookList;

  void addBook(
    String id,
    String title,
    String author,
    String imgUrl,
    String viewUrl,
    String downloadUrl,
  ) {
    bookList.add(
      SavedBook(
        id: id,
        title: title,
        author: author,
        imgUrl: imgUrl,
        viewUrl: viewUrl,
        downloadUrl: downloadUrl,
        saveStatus: true,
      ),
    );
    notifyListeners();
  }

  void removeBook(
    String id,
  ) {
    bookList.removeWhere(
      (SavedBook element) => element.id.contains(id) && element.saveStatus,
    );
    notifyListeners();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/saved_book.dart';

class SavedBooksProvider with ChangeNotifier {
  final List<SavedBook> _bookList = <SavedBook>[];

  List<SavedBook> get bookList => _bookList;

  // void addBook(
  // String id,
  // String title,
  // String author,
  // String imgUrl,
  // String viewUrl,
  // String downloadUrl,
  // ) {
  //   bookList.add(
  //     SavedBook(
  //       id: id,
  //       title: title,
  //       author: author,
  //       imgUrl: imgUrl,
  //       viewUrl: viewUrl,
  //       downloadUrl: downloadUrl,
  //       saveStatus: true,
  //     ),
  //   );
  //   notifyListeners();
  // }
  Future<void> addBook(
    String userID,
    String id,
    String title,
    String author,
    String imgUrl,
    String viewUrl,
    String downloadUrl,
  ) async {
    await FirebaseFirestore.instance
        .collection('savedBooks')
        .doc(userID)
        .collection('books')
        .add({
      'id': id,
      'title': title,
      'author': author,
      'imgUrl': imgUrl,
      'viewUrl': viewUrl,
      'downloadUrl': downloadUrl,
    });
  }

  // void removeBook(
  //   String id,
  // ) {
  //   bookList.removeWhere(
  //     (SavedBook element) => element.id.contains(id) && element.saveStatus,
  //   );
  //   notifyListeners();
  // }
  Future<void> removeBook(
    String id,
    String userID,
    String bookID,
  ) async {
    await FirebaseFirestore.instance
        .collection('savedBooks')
        .doc(userID)
        .collection('books')
        .doc(bookID)
        .delete()
        .then((value) => print('delted $bookID $userID '))
        .catchError((error) => print(error));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/saved_book.dart';

/// Provider for the Saved Books
class SavedBooksProvider with ChangeNotifier {
  final List<SavedBook> _bookList = <SavedBook>[];

  /// Getter of the saved book list.
  List<SavedBook> get bookList => _bookList;

  /// Function to add the book in the getter list.
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
        .doc(id)
        .set(<String, dynamic>{
      'id': id,
      'title': title,
      'author': author,
      'imgUrl': imgUrl,
      'viewUrl': viewUrl,
      'downloadUrl': downloadUrl,
    }).then((void value) {});
  }

  /// Function to remove the book from the getter list.
  Future<void> removeBook(
    String id,
    String userID,
  ) async {
    await FirebaseFirestore.instance
        .collection('savedBooks')
        .doc(userID)
        .collection('books')
        .doc(id)
        .delete()
        .then((void value) {})
        .catchError((dynamic error) {});
  }
}

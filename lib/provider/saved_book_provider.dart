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
    BuildContext context,
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
    }).then((void value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Book Saved'),
          duration: Duration(seconds: 1),
        ),
      );
    });
  }

  /// Function to remove the book from the getter list.
  Future<void> removeBook(
    String id,
    String userID,
    BuildContext context,
  ) async {
    await FirebaseFirestore.instance
        .collection('savedBooks')
        .doc(userID)
        .collection('books')
        .doc(id)
        .delete()
        .then((void value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Book Removed'),
          duration: Duration(seconds: 1),
        ),
      );
    }).catchError((dynamic error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An Error Occured, Please try again later'),
          duration: Duration(seconds: 1),
        ),
      );
    });
  }
}

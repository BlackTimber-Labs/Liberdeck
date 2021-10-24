import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/saved_book_tile.dart';

/// Root Widget of the Saved Book Screen
class SavedBooksScreen extends StatefulWidget {
  /// Routename of the Saved Book Screen
  static const String routename = '/saved_books_screen';
  @override
  _SavedBooksScreenState createState() => _SavedBooksScreenState();
}

class _SavedBooksScreenState extends State<SavedBooksScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final User? user = FirebaseAuth.instance.currentUser;
    final String userID = user!.uid;
    return Scaffold(
      body: SizedBox(
        height: height,
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('savedBooks')
              .doc(userID)
              .collection('books')
              .snapshots(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot<Object?>> booksSnapshot,
          ) {
            if (booksSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (booksSnapshot.data!.docs.isEmpty) {
              return const Center(child: Text('Save some books'));
            } else {
              return ListView(
                children: booksSnapshot.data!.docs
                    .map((QueryDocumentSnapshot<Object?> document) {
                  final Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return SavedBookTile(
                    userID: userID,
                    title: data['title'].toString(),
                    author: data['author'].toString(),
                    imgUrl: data['imgUrl'].toString(),
                    id: data['id'].toString(),
                    downloadUrl: data['downloadUrl'].toString(),
                    viewUrl: data['viewUrl'].toString(),
                    height: height,
                    width: width,
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}

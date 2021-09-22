import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/books_screen/book_tile.dart';

class SavedBooksScreen extends StatefulWidget {
  static const String routename = '/saved_books_screen';
  @override
  _SavedBooksScreenState createState() => _SavedBooksScreenState();
}

class _SavedBooksScreenState extends State<SavedBooksScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final user = FirebaseAuth.instance.currentUser;
    final userID = user!.uid;
    return Scaffold(
      body: Container(
          height: height,
          // child: Consumer<SavedBooksProvider>(builder: (
          //   BuildContext context,
          //   SavedBooksProvider books,
          //   Widget? child,
          // ) {
          //   return ListView.builder(
          //     itemBuilder: (
          //       BuildContext ctx,
          //       int i,
          //     ) {
          // return BookTile(
          //   userID: userID,
          //   title: books.bookList[i].title,
          //   author: books.bookList[i].title,
          //   imgUrl: books.bookList[i].imgUrl,
          //   saveStatus: books.bookList[i].saveStatus,
          //   id: books.bookList[i].id,
          //   downloadUrl: books.bookList[i].downloadUrl,
          //   viewUrl: books.bookList[i].viewUrl,
          //   height: height,
          //   width: width,
          // );
          //     },
          //     itemCount: books.bookList.length,
          //   );
          // }
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('savedBooks')
                .doc(userID)
                .collection('books')
                .snapshots(),
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> booksSnapshot,
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
                    return BookTile(
                      bookID: document.id,
                      userID: userID,
                      title: data['title'].toString(),
                      author: data['author'].toString(),
                      imgUrl: data['imgUrl'].toString(),
                      saveStatus: true,
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
          )),
    );
  }
}

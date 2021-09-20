import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/saved_book_provider.dart';

import '../widgets/books_screen/book_tile.dart';

class SavedBooksScreen extends StatefulWidget {
  
static const String routename = '/saved_books_screen';
  @override
  _SavedBooksScreenState createState() => _SavedBooksScreenState();
}

class _SavedBooksScreenState extends State<SavedBooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      child: Consumer<SavedBooksProvider>(builder: (
        BuildContext context,
        SavedBooksProvider books,
        Widget? child,
      ) {
        return ListView.builder(
          itemBuilder: (ctx, i) {
            return BookTile(
              title: books.bookList[i].title,
              author: books.bookList[i].title,
              imgUrl: books.bookList[i].title,
              saveStatus: books.bookList[i].saveStatus,
              id:books.bookList[i].id,
              downloadUrl: books.bookList[i].downloadUrl,
              viewUrl: books.bookList[i].viewUrl,
            );
          },
          itemCount: books.bookList.length,
        );
      }),
    ));
  }
}

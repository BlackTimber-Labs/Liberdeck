import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/books_provider.dart';

import '../widgets/books_screen/book_tile.dart';
import '../widgets/text_header.dart';

class BooksViewScreen extends StatefulWidget {
  static const String routename = '/books_view_screen';
  @override
  _BooksViewScreenState createState() => _BooksViewScreenState();
}

class _BooksViewScreenState extends State<BooksViewScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              height: height * 0.3,
              width: width,
              child: TextHeader(
                width: width,
                height: height,
                topright: 'assets/images/bookTopRight.png',
                topleft: 'assets/images/bookTopLeft.png',
                title: 'MA2101',
                subtitle: 'ENGG MATHS',
              ),
            ),
            Expanded(
              child: Container(
                height: height * 0.6,
                child: Consumer<BooksProvider>(builder: (
                  BuildContext context,
                  BooksProvider books,
                  Widget? child,
                ) {
                  return ListView.builder(
                    itemBuilder: (
                      BuildContext ctx,
                      int i,
                    ) {
                      return BookTile(
                        title: books.bookList[i].title,
                        author: books.bookList[i].author,
                        imgUrl: books.bookList[i].imgUrl,
                        saveStatus: books.bookList[i].saveStatus,
                        id:books.bookList[i].id,
                        downloadUrl: books.bookList[i].downloadUrl,
                        viewUrl: books.bookList[i].viewUrl,
                      );
                    },
                    itemCount: books.bookList.length,
                  );
                }),
              ),
            )
          ],
        ));
  }
}

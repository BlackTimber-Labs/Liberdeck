import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/book.dart';

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
    final BooksArguments args =
        ModalRoute.of(context)!.settings.arguments as BooksArguments;
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
                BooksProvider booksList,
                Widget? child,
              ) {
                final List<Book> books = booksList.findBook(
                  args.courseID,
                  args.departmentID,
                  args.semID,
                  args.subID,
                );
                return ListView.builder(
                  itemBuilder: (
                    BuildContext ctx,
                    int i,
                  ) {
                    return BookTile(
                      title: books[i].title,
                      author: books[i].author,
                      imgUrl: books[i].imgUrl,
                      saveStatus: books[i].saveStatus,
                      id: books[i].id,
                      downloadUrl: books[i].downloadUrl,
                      viewUrl: books[i].viewUrl,
                    );
                  },
                  itemCount: books.length,
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

class BooksArguments {
  String courseID;
  String departmentID;
  String subID;
  int semID;

  BooksArguments({
    required this.courseID,
    required this.departmentID,
    required this.semID,
    required this.subID,
  });
}

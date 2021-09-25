import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './bottom_navigation_screen.dart';

import '../model/book.dart';

import '../provider/books_provider.dart';

import '../widgets/book_tile.dart';
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
    final User? user = FirebaseAuth.instance.currentUser;
    final String userID = user!.uid;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: height * 0.3,
            width: width,
            child: TextHeader(
              width: width,
              height: height,
              topRight: 'assets/images/bookTopRight.png',
              topLeft: 'assets/images/bookTopLeft.png',
              title: args.subID.toUpperCase(),
              subTitle: args.subName.toString(),
            ),
          ),
          SizedBox(
            height: height * 0.6,
            child: Consumer<BooksProvider>(
              builder: (
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
                      userID: userID,
                      title: books[i].title,
                      author: books[i].author,
                      imgUrl: books[i].imgUrl,
                      saveStatus: books[i].saveStatus,
                      id: books[i].id,
                      downloadUrl: books[i].downloadUrl,
                      viewUrl: books[i].viewUrl,
                      height: height,
                      width: width,
                    );
                  },
                  itemCount: books.length,
                );
              },
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                BottomNavigationScreen.routename,
                (Route<dynamic> route) => false,
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFF843622),
              ),
              child: const Center(
                child: Text(
                  'DONE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BooksArguments {
  BooksArguments({
    required this.courseID,
    required this.departmentID,
    required this.semID,
    required this.subID,
    required this.subName,
  });
  String courseID;
  String departmentID;
  String subID;
  String subName;
  int semID;
}

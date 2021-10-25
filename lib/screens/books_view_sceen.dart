import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './bottom_navigation_screen.dart';

import '../widgets/book_tile.dart';
import '../widgets/text_header.dart';

/// Root Widget of the Books View Screen
class BooksViewScreen extends StatefulWidget {
  /// Rootname of the Books View Screen
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
        // ignore: cast_nullable_to_non_nullable
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
              child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                future: FirebaseFirestore.instance
                    .collection('courses')
                    .doc(args.courseID)
                    .collection('departments')
                    .doc(args.departmentID)
                    .collection('semesters')
                    .doc(args.semID.toString())
                    .collection('subjects')
                    .doc(args.subID)
                    .collection('books')
                    .get(),
                builder: (
                  ctx,
                  snapshot,
                ) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final list = snapshot.data!.docs;
                    return list.isEmpty
                        ? const Center(
                            child: Text(
                              'Coming Soon',
                            ),
                          )
                        : ListView.builder(
                            itemBuilder: (
                              BuildContext ctx,
                              int i,
                            ) {
                              return BookTile(
                                userID: userID,
                                title: list[i]['title'].toString(),
                                // saveStatus: false,
                                author: list[i]['author'].toString(),
                                imgUrl: list[i]['imgUrl'].toString(),
                                id: list[i]['id'].toString(),
                                downloadUrl: list[i]['downloadUrl'].toString(),
                                viewUrl: list[i]['viewUrl'].toString(),
                                height: height,
                                width: width,
                              );
                            },
                            itemCount: list.length,
                          );
                  }
                },
              )),
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

/// Argument Class for the Books View Screen
class BooksArguments {
  /// Constructor
  BooksArguments({
    required this.courseID,
    required this.departmentID,
    required this.semID,
    required this.subID,
    required this.subName,
  });

  /// CourseID of the Course User Selected
  String courseID;

  /// DepartmentID of the Department User Selected
  String departmentID;

  /// SubjectID of the Subject User Selected
  String subID;

  /// Subject Name of the Subject User Selected
  String subName;

  /// SemesterID of the Semester User Selected
  int semID;
}

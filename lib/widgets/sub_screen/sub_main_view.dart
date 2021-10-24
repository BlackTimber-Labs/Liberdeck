import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../screens/books_view_sceen.dart';

/// Root Widegt of the Subject Screen's Main Component
class SubMainView extends StatefulWidget {
  ///
  const SubMainView({
    Key? key,
    required this.height,
    required this.width,
    required this.courseID,
    required this.departmentID,
    required this.semID,
  }) : super(key: key);

  /// Height of the Screen in which this widget is used.
  final double height;

  /// Width of the Screen in which this widget is used.
  final double width;

  /// Course Id
  final String courseID;

  /// Department Id
  final String departmentID;

  /// Semester Id
  final int semID;

  @override
  State<SubMainView> createState() => _SubMainViewState();
}

class _SubMainViewState extends State<SubMainView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('courses')
            .doc(widget.courseID)
            .collection('departments')
            .doc(widget.departmentID)
            .collection('semesters')
            .doc(widget.semID.toString())
            .collection('subjects')
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
                ? const Center(child: Text('Coming Soon '))
                : StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: list.length,
                    itemBuilder: (
                      BuildContext context,
                      int i,
                    ) {
                      final subName = list[i]['name'].toString();
                      final subID = list[i]['id'].toString();
                      return Material(
                        color: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              BooksViewScreen.routename,
                              arguments: BooksArguments(
                                courseID: widget.courseID,
                                departmentID: widget.departmentID,
                                semID: widget.semID,
                                subID: subID,
                                subName: subName,
                              ),
                            );
                          },
                          child: Container(
                            height: widget.height * 0.1,
                            width: widget.width * 0.2,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .buttonTheme
                                  .colorScheme!
                                  .background,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                subID.toUpperCase(),
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.button,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    staggeredTileBuilder: (int index) =>
                        StaggeredTile.count(2, index.isEven ? 1 : 1),
                    mainAxisSpacing: widget.height * 0.02,
                    crossAxisSpacing: widget.width * 0.04,
                  );
          }
        });
  }
}

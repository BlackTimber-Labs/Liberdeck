import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../model/subject.dart';

import '../../provider/subject_provider.dart';

import '../../screens/books_view_sceen.dart';

/// Root Widegt of the Subject Screen's Main Component
class SubMainView extends StatelessWidget {
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

  final String courseID;
  final String departmentID;
  final int semID;
  @override
  Widget build(BuildContext context) {
    final SubjectProvider subProvider = Provider.of<SubjectProvider>(context);
    final List<Subject> subList = subProvider.findSubject(
      courseID,
      departmentID,
      semID,
    );
    return subList.isEmpty
        ? const Center(child: Text('Coming Soon '))
        : StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: subList.length,
            itemBuilder: (BuildContext context, int i) => Material(
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 1,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    BooksViewScreen.routename,
                    arguments: BooksArguments(
                      courseID: courseID,
                      departmentID: departmentID,
                      semID: semID,
                      subID: subList[i].id,
                      subName:subList[i].name,
                    ),
                  );
                },
                child: Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).buttonTheme.colorScheme!.background,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      subList[i].title,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.button,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(2, index.isEven ? 1 : 1),
            mainAxisSpacing: height * 0.02,
            crossAxisSpacing: width * 0.04,
          );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';

import '../../screens/department_screen.dart';

/// Root Widget of the Subject's Chapter Screen Main Component.
class CourseMainView extends StatelessWidget {
  ///
  const CourseMainView({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  /// Height of the Screen in which this widget is used.
  final double height;

  /// Width of the Screen in which this widget is used.
  final double width;

  @override
  Widget build(BuildContext context) {
    final UserProvider provider = Provider.of<UserProvider>(context);
    final ScrollController _scrollController = ScrollController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: height * 0.07,
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Select Your Course',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 30,
                  ),
              maxLines: 1,
            ),
          ),
        ),
        Container(
          height: height * 0.53,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.08,
          ),
          child: SizedBox(
            height: height * 0.44,
            child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              future: FirebaseFirestore.instance.collection('courses').get(),
              builder: (
                BuildContext ctx,
                snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  final List<QueryDocumentSnapshot<Map<String, dynamic>>> list =
                      snapshot.data!.docs;
                  return ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (
                      BuildContext ctx,
                      int i,
                    ) {
                      // final Cousre course = courses.courseList[i];
                      final courseTitle = list[i]['title'].toString();
                      final courseID = list[i]['id'].toString();
                      return Material(
                        elevation: 2,
                        color: Colors.transparent,
                        shadowColor: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              DepartmentScreen.routename,
                              arguments: courseID,
                            );
                            provider.addCourse(
                              courseTitle,
                              courseID,
                            );

                            // addCourseData(
                            //   courseTitle,
                            //   courseID,
                            // );
                            // provider.userData(
                            //   course: courseTitle,
                            //   courseID: courseID,
                            // );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: height * 0.007,
                            ),
                            height: height * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                courseTitle,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.button,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: list.length,
                  );
                } else {
                  return const Center(
                    child: Text(
                      'An Error Occured',
                    ),
                  );
                }
              },
            ),
          ),
        ),
        Container(
          height: height * 0.05,
          decoration: const BoxDecoration(
            color: Colors.brown,
          ),
          width: width,
          child: IconButton(
            icon: const FaIcon(FontAwesomeIcons.chevronDown),
            onPressed: () async {
              // Delay to make sure the frames are rendered properly
              await Future<dynamic>.delayed(const Duration(milliseconds: 100));
              SchedulerBinding.instance?.addPostFrameCallback((_) {
                _scrollController.animateTo(
                  _scrollController.position.viewportDimension,
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.fastOutSlowIn,
                );
              });
            },
          ),
        ),
      ],
    );
  }
}

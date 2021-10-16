import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../model/course.dart';

import '../../provider/course_provider.dart';
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
    final UserProvider provider =
        Provider.of<UserProvider>(context, listen: false);
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
              style: Theme.of(context).textTheme.headline6,
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
            child: Consumer<CourseProvider>(builder: (
              BuildContext context,
              CourseProvider courses,
              Widget? child,
            ) {
              return ListView.builder(
                controller: _scrollController,
                itemBuilder: (
                  BuildContext ctx,
                  int i,
                ) {
                  final Cousre course = courses.courseList[i];
                  return Material(
                    elevation: 2,
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, DepartmentScreen.routename,
                            arguments: course.id);
                        provider.addCourse(
                          course.title,
                          course.id,
                        );
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
                            course.title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.button,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: courses.courseList.length,
              );
            }),
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

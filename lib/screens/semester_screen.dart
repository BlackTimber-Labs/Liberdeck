import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liberdeck/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../model/semester.dart' as sem_model;

// import '../provider/semester_provider.dart';

import '../widgets/back_button.dart';
import '../widgets/semester_screen/semester_tile.dart' as sem_widget;

/// Root Widget of the Semester Screen
class SemesterScreen extends StatefulWidget {
  /// Routename of the Semester Screen
  static const String routename = '/semester_screen';
  @override
  _SemesterScreenState createState() => _SemesterScreenState();
}

class _SemesterScreenState extends State<SemesterScreen> {
  // String courseID = 'courseID';
  // String departmentID = 'departmentID';

  // Future<SharedPreferences> Data() async {
  //   return SharedPreferences.getInstance();
  // }

  // Future<void> data() async {
  //   await Data().then((value) {
  //     setState(() {
  //       courseID = value.getString('courseID') ?? 'courseID';
  //       departmentID = value.getString('departmentID') ?? 'departmentID';
  //     });
  //     print(courseID);
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   data();
  // }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final args =
        ModalRoute.of(context)!.settings.arguments as SemesterScreenArgs;
    final departmentID = args.departmentID;
    final courseID = args.courseID;
    //final user = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/images/semester_screen_top_right.png'),
                alignment: Alignment.topRight,
              ),
            ),
          ),
          const Center(
            child: Text(
              'Select your Semester',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.7,
            // child: Consumer<SemesterProvider>(
            //   builder: (
            //     BuildContext context,
            //     SemesterProvider sem,
            //     Widget? child,
            //   ) {
            //     final List<sem_model.Semester> semesterList = sem.findSemester(
            //       'btech',
            //       departmentId.toString(),
            //     );
            // return semesterList.isEmpty
            //     ? const Center(child: Text('Coming Soon '))
            //     : ListView.builder(
            //         itemBuilder: (
            //           BuildContext ctx,
            //           int i,
            //         ) {
            //           return sem_widget.SemesterTile(
            //             sem: semesterList[i].title,
            //             departmentID: semesterList[i].departmentID,
            //             semID: semesterList[i].id,
            //             ctx: context,
            //           );
            //         },
            //         itemCount: semesterList.length,
            //       );
            //   },
            // ),
            child: StreamBuilder<SharedPreferences>(
                stream: SharedPreferences.getInstance().asStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    // final courseID = snapshot.data!.getString('courseID');
                    // final departmentID =
                    //     snapshot.data!.getString('departmentID');
                    return FutureBuilder<QuerySnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('courses')
                          .doc(courseID)
                          .collection('departments')
                          .doc(departmentID)
                          .collection('semesters')
                          .get(),
                      builder: (
                        ctx,
                        snapshot,
                      ) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasData) {
                          final list = snapshot.data!.docs;
                          print(departmentID);
                          return
                              // list.isEmpty
                              //     ? const Center(child: Text('Coming Soon '))
                              //     :
                              ListView.builder(
                            itemBuilder: (
                              BuildContext ctx,
                              int i,
                            ) {
                              return sem_widget.SemesterTile(
                                sem: list[i]['title'].toString(),
                                departmentID: departmentID.toString(),
                                courseID: courseID.toString(),
                                semID: int.parse("${list[i]['id']}"),
                                ctx: context,
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
                    );
                  } else {
                    return const Center(
                      child: Text(
                        'An Error Occured',
                      ),
                    );
                  }
                }),
          ),
          BackButtonWidget(),
        ],
      ),
    );
  }
}

class SemesterScreenArgs {
  SemesterScreenArgs({
    required this.departmentID,
    required this.courseID,
  });
  final String departmentID;
  final String courseID;
}

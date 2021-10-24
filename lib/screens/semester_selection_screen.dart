import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/selection_screen/selection.dart';

class SemesterSelectionScreen extends StatefulWidget {
  const SemesterSelectionScreen({Key? key}) : super(key: key);
  static const String routename = '/course_selection_screen';
  @override
  State<SemesterSelectionScreen> createState() =>
      _SemesterSelectionScreenState();
}

class _SemesterSelectionScreenState extends State<SemesterSelectionScreen> {
  String courseID = 'courseID';
  String departmentID = 'departmentID';
  int semID = 0;
  String semester = 'semester';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Your Semester',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (
            context,
            snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              courseID = snapshot.data!.get('courseID').toString();
              departmentID = snapshot.data!.get('departmentID').toString();
              semID = snapshot.data!.get('semID') as int;
              return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('courses')
                    .doc(courseID)
                    .collection('departments')
                    .doc(departmentID)
                    .collection('semesters')
                    .snapshots(),
                builder: (
                  BuildContext context,
                  snapshot,
                ) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    return SizedBox(
                      height: height,
                      width: 100,
                      child: ListView.builder(
                        itemBuilder: (
                          BuildContext ctx,
                          int i,
                        ) {
                          semester = snapshot.data!.docs[i]['title'].toString();
                          print(snapshot.data!.docs[i]['id']);
                          print(semID);
                          return OptionsTile(
                            semID: snapshot.data!.docs[i]['id'] as int,
                            name: semester,
                            colour: semID == (snapshot.data!.docs[i]['id'])
                                ? Colors.green
                                : Colors.grey,
                          );
                        },
                        itemCount: snapshot.data!.docs.length,
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text('An error Occurd'),
                    );
                  }
                },
              );
            } else {
              return const Center(
                child: Text('An error Occurd'),
              );
            }
          },
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liberdeck/widgets/selection_screen/selection.dart';

class CourseSelectionScreen extends StatefulWidget {
  const CourseSelectionScreen({Key? key}) : super(key: key);
  static const String routename = '/course_selection_screen';
  @override
  State<CourseSelectionScreen> createState() => _CourseSelectionScreenState();
}

class _CourseSelectionScreenState extends State<CourseSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Your Course',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        height: 200,
        width: 200,
        child: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream:
                FirebaseFirestore.instance.collection('courses').snapshots(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  height: 200,
        width: 200,
                  child: ListView.builder(
                    itemBuilder: (
                      BuildContext ctx,
                      int i,
                    ) {
                      return OptionsTile(
                        name: snapshot.data!.docs[i]['title'].toString(),
                        colour: i % 2 == 0
                            ? const Color(0xFFEE6830)
                            : const Color(0xFFC45628),
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

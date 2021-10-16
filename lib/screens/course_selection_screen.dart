import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('courses').snapshots(),
          builder: (BuildContext context, snapshot) {
            return Container(
              child: Text('${snapshot.data!.docs[1]['']}'),
            );
          },
        ),
      ),
    );
  }
}

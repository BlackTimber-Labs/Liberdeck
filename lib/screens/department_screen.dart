import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/back_button.dart';
import '../widgets/department_screen/department_tile.dart';

/// Root Widget of the Department Screen
class DepartmentScreen extends StatefulWidget {
  /// Route name of the Department Screen
  static const String routename = '/department_screen';

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final String courseID =
        ModalRoute.of(context)!.settings.arguments.toString();
    //final user = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Circle(),
          // Center(
          //   child: Text(
          //     'Hey ${user.displayName!.split(" ")[0].toUpperCase()}!',
          //     textAlign: TextAlign.center,
          //     style: const TextStyle(
          //       fontSize: 29,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // ),
          const SizedBox(height: 5),
          const Center(
            child: Text(
              'Select your department',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 5),
          StreamBuilder<SharedPreferences>(
              stream: SharedPreferences.getInstance().asStream(),
              builder: (
                context,
                snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return SizedBox(
                    height: height * 0.65,
                    child: FutureBuilder<QuerySnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('courses')
                          .doc(courseID)
                          .collection('departments')
                          .get(),
                      builder: (
                        BuildContext ctx,
                        snapshot,
                      ) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          final list = snapshot.data!.docs;
                          // print(user.user!.course);
                          return ListView.builder(
                            itemBuilder: (
                              BuildContext ctx,
                              int i,
                            ) {
                              final departmentTitle =
                                  list[i]['title'].toString();
                              final departmentID = list[i]['id'].toString();
                              return DepartmentTile(
                                name: departmentTitle,
                                color: i % 2 == 0
                                    ? const Color(0xFFEE6830)
                                    : const Color(0xFFC45628),
                                departmentID: departmentID,
                                ctx: context,
                                courseID: courseID.toString(),
                              );
                            },
                            itemCount: list.length,
                          );
                        }
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('An Error Occured'),
                  );
                }
              }),
          BackButtonWidget(),
        ],
      ),
    );
  }
}

/// Top Circle Widget
class Circle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/department_screen_center.png'),
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}

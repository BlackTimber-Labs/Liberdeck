import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/department_provider.dart';

import '../widgets/department_screen/department.dart';

class DepartmentScreen extends StatefulWidget {
  static const String routename = '/department_screen';

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Circle(),
          Center(
            child: Text(
              'Hey ${user.displayName!.split(" ")[0].toUpperCase()}!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
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
          SizedBox(
            height: height * 0.65,
            child: Consumer<DepartmentProvider>(
              builder: (
                BuildContext context,
                DepartmentProvider departments,
                Widget? child,
              ) {
                return ListView.builder(
                  itemBuilder: (
                    BuildContext ctx,
                    int i,
                  ) {
                    return Department(
                      name: departments.departmentList[i].title,
                      colour: i % 2 == 0
                          ? const Color(0xFFEE6830)
                          : const Color(0xFFC45628),
                      departmentID: departments.departmentList[i].id,
                    );
                  },
                  itemCount: departments.departmentList.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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

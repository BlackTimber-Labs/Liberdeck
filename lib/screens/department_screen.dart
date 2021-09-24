import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './semester_screen.dart';

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
    return Scaffold(
      body: Column(
        children: <Widget>[
          Circle(),
          const Center(
            child: Text(
              'Select your department',
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: height * 0.6,
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
          // BN(),
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

class BN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // TextButton(
        //   onPressed: () {
        //     setState(() {});
        //   },
        //   child: Container(
        //     height: 55,
        //     width: 132,
        //     decoration: BoxDecoration(
        //       color: Color(0xFF843622),
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //     child: Center(
        //         child: Text(
        //       'Back',
        //       style: TextStyle(
        //           fontSize: 32,
        //           fontWeight: FontWeight.w600,
        //           color: Colors.white),
        //     )),
        //   ),
        // ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, SemesterScreen.routename);
          },
          child: Container(
            height: 55,
            width: 132,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFF843622),
            ),
            child: const Center(
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

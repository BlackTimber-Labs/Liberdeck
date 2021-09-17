import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import './provider/books_provider.dart';
import './provider/course_provider.dart';
import './provider/department_provider.dart';
import './provider/semester_provider.dart';
import './provider/subject_provider.dart';

import './screens/sub_chp_screen.dart';
import './screens/sub_screen.dart';

void main() {
  runApp(MyApp());
}

/// Root Widget of the App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: <SingleChildWidget>[
          ChangeNotifierProvider<CourseProvider>(
              create: (_) => CourseProvider()),
          ChangeNotifierProvider<DepartmentProvider>(
              create: (_) => DepartmentProvider()),
          ChangeNotifierProvider<SemesterProvider>(
              create: (_) => SemesterProvider()),
          ChangeNotifierProvider<SubjectProvider>(
              create: (_) => SubjectProvider()),
          ChangeNotifierProvider<BooksProvider>(create: (_) => BooksProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Liberdeck',
          theme: ThemeData(
            textTheme: const TextTheme(
              headline6: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 40,
              ),
              headline5: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 22.5,
              ),
              button: TextStyle(
                fontFamily: 'SF UI Display',
                fontWeight: FontWeight.w500,
                fontSize: 22.5,
              ),
              bodyText1: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 19.5,
              ),
            ),
            primarySwatch: Colors.orange,
          ),
          home: const MyHomePage(),
          routes: <String, WidgetBuilder>{
            SubScreen.routename: (BuildContext ctx) => const SubScreen(),
            SubChpScreen.routename: (BuildContext ctx) => const SubChpScreen(),
          },
        ));
  }
}

///
class MyHomePage extends StatefulWidget {
  ///
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const SubScreen();
  }
}

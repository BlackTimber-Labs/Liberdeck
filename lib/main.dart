import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import './provider/books_provider.dart';
import './provider/course_provider.dart';
import './provider/department_provider.dart';
import './provider/google_sign_in.dart';
import './provider/saved_book_provider.dart';
import './provider/semester_provider.dart';
import './provider/subject_provider.dart';

import './screens/about_screen.dart';
import './screens/books_view_sceen.dart';
import './screens/bottom_navigation_screen.dart';
import './screens/department_screen.dart';
import './screens/login_screen.dart';
import './screens/profile_screen.dart';
import './screens/saved_book_screen.dart';
import './screens/semester_screen.dart';
import './screens/sub_chp_screen.dart';
import './screens/sub_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/// Root Widget of the App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<GoogleSignInProvider>(
            create: (_) => GoogleSignInProvider()),
        ChangeNotifierProvider<CourseProvider>(create: (_) => CourseProvider()),
        ChangeNotifierProvider<DepartmentProvider>(
            create: (_) => DepartmentProvider()),
        ChangeNotifierProvider<SemesterProvider>(
            create: (_) => SemesterProvider()),
        ChangeNotifierProvider<SubjectProvider>(
            create: (_) => SubjectProvider()),
        ChangeNotifierProvider<BooksProvider>(create: (_) => BooksProvider()),
        ChangeNotifierProvider<SavedBooksProvider>(
            create: (_) => SavedBooksProvider()),
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

        home: BottomNavigationScreen(),
        // home: SavedBookScreen(),
        routes: <String, WidgetBuilder>{
          SubScreen.routename: (BuildContext ctx) => const SubScreen(),
          SubChpScreen.routename: (BuildContext ctx) => const SubChpScreen(),
          BooksViewScreen.routename: (BuildContext ctx) => BooksViewScreen(),
          SavedBooksScreen.routename: (BuildContext ctx) => SavedBooksScreen(),
          SemesterScreen.routename: (BuildContext ctx) => SemesterScreen(),
          DepartmentScreen.routename: (BuildContext ctx) => DepartmentScreen(),
          AboutScreen.routename: (BuildContext ctx) => AboutScreen(),
          LoginScreen.routename: (BuildContext ctx) => LoginScreen(),
          ProfileScreen.routename: (BuildContext ctx) => ProfileScreen(),
          BottomNavigationScreen.routename: (BuildContext ctx) =>
              BottomNavigationScreen(),
        },
      ),
    );
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
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something Went Wrong!'),
            );
          } else if (snapshot.hasData) {
            return const SubScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}

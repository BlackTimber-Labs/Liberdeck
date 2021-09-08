import 'package:bookify/screens/sub_screen.dart';
import 'package:flutter/material.dart';

import 'screens/sub_chp_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            fontSize: 40,
          ),
          headline5: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 22.5,
          ),
          button: TextStyle(
            fontFamily: "SF UI Display",
            fontWeight: FontWeight.w500,
            fontSize: 22.5,
          ),
        ),
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
      routes: {
        SubScreen.routename: (ctx) => SubScreen(),
        SubChpScreen.routename: (ctx) => SubChpScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SubScreen();
  }
}

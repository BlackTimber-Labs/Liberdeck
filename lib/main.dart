import 'package:flutter/material.dart';

//import "./screens/settings_screen.dart";
import './screens/sub_chp_screen.dart';
import './screens/sub_screen.dart';

void main() {
  runApp(MyApp());
}

/// Root Widget of the App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        // SettingsScreen.routename: (BuildContext ctx) => SettingsScreen(),
      },
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
    return const SubScreen();
  }
}

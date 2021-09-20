import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'semester_screen.dart';
import 'department_screen.dart';
import 'books_page.dart';
import 'profile_page.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}
int _currentIndex=0;
final tabs =[
  Developer(),
  ViewBooks(),
  BodyS(),
  //todo change this as per your need.
];
class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: tabs[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFFFFE7D5),
        unselectedItemColor: Colors.white,
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(size: 30),
        unselectedIconTheme: IconThemeData(size: 23.5),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF843622),
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home,color: Color(0xFFF8F8F8),),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidBookmark,color: Color(0xFFF8F8F8)),
              label: 'Bookmark'
          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidUserCircle,color: Color(0xFFF8F8F8)),
              label: 'Profile'
          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.signOutAlt,color: Color(0xFFF8F8F8),),
              label: 'Log Out'
          ),
        ],
      ),
    );
  }
}

class Developer extends StatefulWidget {
  @override
  _DeveloperState createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Background(),
        Padding(padding: EdgeInsets.only(left: 28),
          child: Text('BEHIND THE \nSCENES',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.w700),),
        ),
        SizedBox(height: 19,),
        Padding(padding: EdgeInsets.only(left: 28),
          child: Text('APP DEVELOPERS',style: TextStyle(fontSize: 24.5,fontWeight: FontWeight.w600),),
        ),
        SizedBox(height: 10,),
        Harshita(),
        SizedBox(height: 10,),
        Tushar(),
        SizedBox(height: 10,),
        Yash(),

      ],
    );
  }
}


class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/about_screen_top_left.png'),
                    alignment: Alignment.topLeft
                )
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/about_screen_top_right.png'),
                    alignment: Alignment.topRight
                )
            ),
          ),
        ),
      ],
    );
  }
}


class Harshita extends StatefulWidget {
  @override
  _HarshitaState createState() => _HarshitaState();
}

class _HarshitaState extends State<Harshita> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 100.0,
          backgroundImage: AssetImage('assets/images/about_screen_Harshita.png'),
        ),
        SizedBox(height: 5,),
        Center(child: Text('Harshita Sadadekar',style: TextStyle(fontSize: 21.5,fontWeight: FontWeight.w600),)),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(FontAwesomeIcons.github),
              onPressed: () {
                launch('https://github.com/HarshitaSadadekar');
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.linkedin),
              onPressed: () {
                launch('https://www.linkedin.com/in/harshita-sadadekar-94196b1b8/');
              },
            )
          ],
        )
      ],
    );
  }
}

class Tushar extends StatefulWidget {
  @override
  _TusharState createState() => _TusharState();
}

class _TusharState extends State<Tushar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 100.0,
          backgroundImage: AssetImage('assets/images/about_screen_Tushar.jpg'),
        ),
        SizedBox(height: 5,),
        Center(child: Text('Tushar Khurana',style: TextStyle(fontSize: 21.5,fontWeight: FontWeight.w600),)),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(FontAwesomeIcons.github),
              onPressed: () {
                launch('https://github.com/Tusharkhurana70');
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.linkedin),
              onPressed: () {
                launch('https://www.linkedin.com/in/tushar-khurana-6a282b130/');
              },
            )
          ],
        )
      ],
    );
  }
}

class Yash extends StatefulWidget {
  @override
  _YashState createState() => _YashState();
}

class _YashState extends State<Yash> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 100.0,
          backgroundImage: AssetImage('assets/images/about_screen_Yash.jpg'),
        ),
        SizedBox(height: 5,),
        Center(child: Text('Yash Garg',style: TextStyle(fontSize: 21.5,fontWeight: FontWeight.w600),)),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(FontAwesomeIcons.github),
              onPressed: () {
                launch('https://github.com/Megabyte-143');
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.linkedin),
              onPressed: () {
                launch('https://www.linkedin.com/in/yash-garg-megabyte');
              },
            )
          ],
        )
      ],
    );
  }
}


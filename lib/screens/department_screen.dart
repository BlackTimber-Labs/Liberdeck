import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './books_sceen.dart';
import './profile_screen.dart';
import './semester_screen.dart';

class DepartmentScreen extends StatefulWidget {
  static const String routename = '/department_screen';
  @override
  _DepartmentScreenState createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  int _currentIndex=0;

  final tabs =[
    Cont(),
    BooksViewScreen(),
    BodyS(),
    //todo change this as per your need.
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
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
      body: SafeArea(child: tabs[_currentIndex]),
    );
  }
}
class Cont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Circle(),
        Center(child: Text('Select your department',style: TextStyle(fontSize: 29,fontWeight: FontWeight.w600),)),
        SizedBox(height: 15,),
        Branch('CSE', Color(0xFFC45628)),
        SizedBox1(),
        Branch('IT',Color(0xFFEE6830)),
        SizedBox1(),
        Branch('CCE', Color(0xFFC45628)),
        SizedBox1(),
        Branch('DSE',Color(0xFFEE6830)),
        SizedBox1(),
        Branch('EEE', Color(0xFFC45628)),
        SizedBox1(),
        Branch('ECE',Color(0xFFEE6830)),
        SizedBox1(),
        Branch('ENI', Color(0xFFC45628)),
        SizedBox1(),
        Branch('CIVIL',Color(0xFFEE6830)),
        SizedBox1(),
        Branch('MECHANICAL', Color(0xFFC45628)),
        SizedBox1(),
        Branch('CHEMICAL',Color(0xFFEE6830)),
        SizedBox1(),
        Branch('AUTOMOBILE', Color(0xFFC45628)),
        SizedBox1(),
        Branch('MECHATRONICS',Color(0xFFEE6830)),
        SizedBox(height: 40,),
        BN(),
        SizedBox(height: 30,)
      ],
    );
  }
}


class Circle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/department_screen_center.png'),
              alignment: Alignment.topCenter
          ),
        ),
        child: null
    );
  }
}


class Branch extends StatefulWidget {
  Branch(this.name,this.colour);
  final Color colour;
  final String name;

  @override
  _BranchState createState() => _BranchState();
}

class _BranchState extends State<Branch> {
 @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        setState(() {

        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 27),
        height: 55,
        width: 380,
        decoration: BoxDecoration(
            color: widget.colour,
            borderRadius: BorderRadius.circular(7)
        ),
        child: Center(child: Text(widget.name,style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 1),)),
      ),
    );
  }
}

class SizedBox1 extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return SizedBox(height: 20,);
  }
}

class BN extends StatefulWidget {
  @override
  _BNState createState() => _BNState();
}

class _BNState extends State<BN> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: (){
            setState(() {
            });
          },
          child: Container(
            height: 65,
            width: 132,
            decoration: BoxDecoration(
              color: Color(0xFF843622),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(child: Text('Back',style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600,color: Colors.white),)),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return SemesterScreen();
              }
              ));
            });
          },
          child: Container(
            height: 65,
            width: 132,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFF843622),
            ),
            child: Center(child: Text('Next',style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600,color: Colors.white),)),
          ),
        )
      ],
    );
  }
}

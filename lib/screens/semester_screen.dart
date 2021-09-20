import 'package:flutter/material.dart';
import 'about_screen.dart';

class Scaffo extends StatefulWidget {
  @override
  _ScaffoState createState() => _ScaffoState();
}

class _ScaffoState extends State<Scaffo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Sem(),
    );
  }
}

class Sem extends StatefulWidget {
  @override
  _SemState createState() => _SemState();
}

class _SemState extends State<Sem> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/semester_screen_top_right.png'),
              alignment: Alignment.topRight,
            )
          ),
        ),
        Center(child: Text('Select your Semester',style: TextStyle(fontSize: 29,fontWeight: FontWeight.w600),)),
        SizedBox2(),
        Contain('1st', '2nd'),
        SizedBox2(),
        Contain('3rd', '4th'),
        SizedBox2(),
        Contain('5th', '6th'),
        SizedBox2(),
        Contain('7th', '8th'),
        SizedBox2(),
        Contain('9th', '10th'),
        SizedBox2(),
        BN(),
        SizedBox(height: 30,)
      ],
    );
  }
}


class Contain extends StatefulWidget {
  Contain(this.sem,this.sem2);
  final String sem;
  final String sem2;

  @override
  _ContainState createState() => _ContainState();
}

class _ContainState extends State<Contain> {
 @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: (){
            setState(() {

            });
          },
          child: Container(
            width: 150,
            height: 71,
            decoration: BoxDecoration(
              color: Color(0xFFC45628),
              borderRadius: BorderRadius.circular(7)
            ),
            child: Center(child: Text(widget.sem,style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 1))),
          ),
        ),
        TextButton(
          onPressed: (){
            setState(() {

            });
          },
          child: Container(
            width: 150,
            height: 71,
            decoration: BoxDecoration(
              color: Color(0xFFEE6830),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(child: Text(widget.sem2,style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 1))),
          ),
        )
      ],
    );
  }
}

class SizedBox2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 25,);
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
          onPressed: () {
            setState(() {
              Navigator.pop(context);
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
          onPressed: (){
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return About();
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
        ),
      ],
    );
  }
}


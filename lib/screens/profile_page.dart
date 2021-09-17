import 'package:liberdeck/screens/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              Container(
                height: height* 0.26,
                width: width,
                child: ProfileHeader(),
              ),
              Column(
                children:<Widget> [
                  Center(child: Text('My Profile',style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, letterSpacing: 2.0),)),
                  ProfileInfo(),
                ],
              ),
            ],
          ),
        )
    );
  }
}

class ProfileHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            child: Image(image: AssetImage('assets/images/profileTopLeft.png'),),
          ),
          top: 0, left: 0,
        ),
        Positioned(
          child: Container(
            child: Image(image: AssetImage('assets/images/profileTopRight.png'),),
          ),
          top: 0, right: 0,
        ),
        Positioned(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Image(image: AssetImage('assets/images/profileCenter.png'),),
          ),
        ),
      ],
    );
  }
}

class ProfileInfo extends StatefulWidget {

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Padding(
      padding: EdgeInsets.only(left: 30, top: 20,right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Text('INFORMATION', style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.w600),),
          SizedBox(height: 20),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [
              Text('BRANCH :',style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.w500),),
              SizedBox(width: 80),
              Text(' CSE',style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.w500, color: Color(0xFFC95A2B)),),
            ],
          ),
          SizedBox(height: 20),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [
              Text('YEAR :',style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.w500),),
              SizedBox(width: 110),
              Text(' 2nd',style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.w500, color: Color(0xFFC95A2B)),),
            ],
          ),
          SizedBox(height: 20),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [
              Text('SEMESTER :',style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.w500),),
              SizedBox(width: 60),
              Text(' 3rd',style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.w500, color: Color(0xFFC95A2B)),),
            ],
          ),
          SizedBox(height: 30.0),
          Divider(thickness: 1.0, color: Color(0xFF843622)),
          SizedBox(height: 30.0),
          Text('ACCOUNT', style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.w600),),
          SizedBox(height: 20),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [
              Text('NAME :',style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.w500),),
              SizedBox(width: 100),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    user.displayName!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis ,
                    style: TextStyle(
                        fontSize: 19.5, fontWeight: FontWeight.w500, color: Color(0xFFC95A2B)
                    ),),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [
              Text('EMAIL :',style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.w500),),
              SizedBox(width: 95),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(user.email!,
                    style: TextStyle(
                        fontSize: 19.5, fontWeight: FontWeight.w500, color: Color(0xFFC95A2B)
                    ),),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Center(
            child: TextButton(
              child: Text('About developers', style: TextStyle(fontSize: 19.5, color: Color(0xFF000000)),),
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }
}


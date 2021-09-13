import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';
import '../widget/squared_button.dart';

var selectedIndex =1;

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: height* 0.3,
              width: width,
              child: HeaderSection(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 65),
              child: Row(
              children: <Widget>[
                buildContainer(text: 'Login', index: 0,),
                buildContainer(text: 'Sign Up', index: 1,),
              ],
          ),
            ),
            SizedBox(height: 60),
            InputFields(index: 0),
          ],
        ),
      )
    );
  }
}

class HeaderSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
       Image.asset('images/loginTopLeft.png'),
       Padding(
         padding: EdgeInsets.fromLTRB(90, 61, 0,0),
         child: Text('BOOKIFY',
           style: TextStyle(
             letterSpacing: 1.5,
             fontSize: 51.0, fontWeight: FontWeight.w700,
           ),),
       ),
        Padding(
          padding: EdgeInsets.fromLTRB(80, 120, 0,0),
          child: Text('By BlackTimber Labs',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22.5,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

class buildContainer extends StatefulWidget {
  buildContainer({ required this.text, required this.index});
  final String text;
  final int index;


  @override
  _buildContainerState createState() => _buildContainerState();
}

class _buildContainerState extends State<buildContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
           selectedIndex= widget.index;
        });
      },
      child: Container(
          height: MediaQuery.of(context).size.height* 0.055,
          width: MediaQuery.of(context).size.width/3,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(widget.text,
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
                ),
                Container(
                  child: widget.index == selectedIndex
                     ? Container(
                        height: 10, width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xFF843622),
                        ),
                      )
                      : Container(
                    height: 10, width: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class InputFields extends StatefulWidget {
  InputFields({ required this.index});
  final int index;

  @override
  _InputFieldsState createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  // String email;
  // String password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            style: TextStyle(fontSize: 20.0),
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            cursorHeight: 25.0,
            onChanged: (value){
              // email=value;
            },
            decoration: selectedIndex == widget.index ? kTextFieldDecoration.copyWith(hintText: 'Email/Mobile') : kTextFieldDecoration.copyWith(hintText: 'UserName')
          ),
          SizedBox(
            height: 30.0,
          ),
          TextField(
            style: TextStyle(fontSize: 20.0),
            obscureText: true,
            textAlign: TextAlign.center,
            cursorHeight: 25.0,
            onChanged: (value) {
              // password =value;
            },
            decoration: kTextFieldDecoration.copyWith(hintText: 'Password'),
          ),
          SizedBox(
            height: 24.0,
          ),
          SquaredButton(
            colour: Color(0xFF843622),
            buttonTitle: 'Log In',
            // buttonOnPressed: (){},
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Expanded(child: Divider(thickness: 1.0, color: Color(0xFF843622),)),
              Text('OR', style: TextStyle(fontSize: 25.0),),
              Expanded(child: Divider(thickness: 1.0,color: Color(0xFF843622),)),
            ],
          ),

          // Image.asset('images/22login.png'),
        ],
      ),
    );
  }
}


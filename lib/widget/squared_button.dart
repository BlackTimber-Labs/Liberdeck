import 'package:flutter/material.dart';

class SquaredButton extends StatelessWidget {
  SquaredButton({required this.colour, required this.buttonTitle,});

  final Color colour;
  final String buttonTitle;
  // final Function buttonOnPressed;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(15.0),
        child: MaterialButton(
          onPressed: (){},
          // onPressed: buttonOnPressed,
          minWidth: 200.0,
          height: 52.0,
          child: Text(
            buttonTitle, style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }


}

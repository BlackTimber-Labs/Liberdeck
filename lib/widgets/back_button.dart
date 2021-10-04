import 'package:flutter/material.dart';

/// Back Button Widget for the different Screens.
/// It will pop the Current Screen when Pressed.
class BackButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 55,
            width: 132,
            decoration: BoxDecoration(
              color: const Color(0xFF843622),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                'Back',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

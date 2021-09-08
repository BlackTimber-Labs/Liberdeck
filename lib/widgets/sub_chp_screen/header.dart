import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            child: Image(
              image: AssetImage(
                "assets/images/sub_chp/top_right.png",
              ),
            ),
          ),
          top: 0,
          right: 0,
        ),
        Positioned(
          child: Container(
            child: Image(
              image: AssetImage(
                "assets/images/sub_chp/top_left.png",
              ),
            ),
          ),
          top: 0,
          left: 0,
        ),
        Positioned(
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/sub_chp/top_center.png",
                ),
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            child: Image(
              image: AssetImage(
                "assets/images/sub/top_right.png",
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
                "assets/images/sub/top_left.png",
              ),
            ),
          ),
          top: 0,
          left: 0,
        ),
        Positioned(
          child: Container(
            padding: EdgeInsets.all(width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hey ABC!",
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Text(
                  "What Subject do you \n want to see?",
                  softWrap: true,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
          ),
          top: 100,
        ),
      ],
    );
  }
}

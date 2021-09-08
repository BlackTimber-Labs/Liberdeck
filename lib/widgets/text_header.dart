import 'package:flutter/material.dart';

// Header Containing Text at the Center Bottom.
class TextHeader extends StatelessWidget {
  const TextHeader({
    Key? key,
    required this.width,
    required this.height,
    required this.topright,
    required this.topleft,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final double width;
  final double height;
  final String topright;
  final String topleft;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          right: 0,
          child: Image(
            image: AssetImage(
              topright,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Image(
            image: AssetImage(
              topleft,
            ),
          ),
        ),
        Positioned(
          top: 100,
          child: Container(
            padding: EdgeInsets.all(width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Text(
                  subtitle,
                  softWrap: true,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

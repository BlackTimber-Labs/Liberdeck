import 'package:flutter/material.dart';

/// Header Widget Containing Text at the Center Bottom.
class TextHeader extends StatelessWidget {
  ///
  const TextHeader({
    Key? key,
    required this.width,
    required this.height,
    required this.topright,
    required this.topleft,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  /// Width of the Screen in which this widget is used.
  final double width;

  /// Height of the Screen in which this widget is used.
  final double height;

  /// Image on Top Right Corner
  final String topright;

  /// Image on Top Left Corner
  final String topleft;

  /// Heading of the Screen
  final String title;

  /// Sub Heading of the Screen
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
          top: height*0.087,
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

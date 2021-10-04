import 'package:flutter/material.dart';

/// Header Widget Containing Text at the Center Bottom.
class TextHeader extends StatelessWidget {
  /// Constructor
  const TextHeader({
    Key? key,
    required this.width,
    required this.height,
    required this.topRight,
    required this.topLeft,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  /// Width of the Screen in which this widget is used.
  final double width;

  /// Height of the Screen in which this widget is used.
  final double height;

  /// Image on Top Right Corner
  final String topRight;

  /// Image on Top Left Corner
  final String topLeft;

  /// Heading of the Screen
  final String title;

  /// Sub Heading of the Screen
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          right: 0,
          child: Image(
            image: AssetImage(
              topRight,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Image(
            image: AssetImage(
              topLeft,
            ),
          ),
        ),
        Positioned(
          top: height * 0.12,
          left: width * 0.05,
          child: Container(
            padding: EdgeInsets.all(width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  softWrap: true,
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                SizedBox(
                  width: width * 0.7,
                  child: Text(
                    subTitle,
                    softWrap: true,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

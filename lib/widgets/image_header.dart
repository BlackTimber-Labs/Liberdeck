import 'package:flutter/material.dart';

/// Header Containing the Image at the top_center.
class ImageHeader extends StatelessWidget {
  /// Constructor of the Class
  const ImageHeader({
    Key? key,
    required this.topRight,
    required this.topLeft,
    required this.topCenter,
  }) : super(key: key);

  /// Image on Top Right Corner
  final String topRight;

  /// Image on Top Left Corner
  final String topLeft;

  /// Image on Top Center
  final String topCenter;

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
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  topCenter,
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

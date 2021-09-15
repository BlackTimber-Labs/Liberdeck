import 'package:flutter/material.dart';

/// Root Widget of the Empty Bottom Bar
class EmptyBottomBar extends StatelessWidget {
  ///
  const EmptyBottomBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  /// Height of the Screen in which this widget is used.
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.04,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
      ),
    );
  }
}

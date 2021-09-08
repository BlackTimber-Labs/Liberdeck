import 'package:flutter/material.dart';

class EmptyBottomBar extends StatelessWidget {
  const EmptyBottomBar({
    Key? key,
    required this.height,
  }) : super(key: key);

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

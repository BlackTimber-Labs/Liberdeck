import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../screens/sub_chp_screen.dart';

/// Root Widegt of the Subject Screen's Main Component
class SubMainView extends StatelessWidget {
  ///
  const SubMainView({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  /// Height of the Screen in which this widget is used.
  final double height;

  /// Width of the Screen in which this widget is used.
  final double width;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 16,
      itemBuilder: (BuildContext context, int index) => Material(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 1,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(SubChpScreen.routename);
          },
          child: Container(
            height: height * 0.1,
            width: width * 0.2,
            decoration: BoxDecoration(
              color: Theme.of(context).buttonTheme.colorScheme!.background,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Subject Code',
                softWrap: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.button,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 1 : 1),
      mainAxisSpacing: height * 0.02,
      crossAxisSpacing: width * 0.04,
    );
  }
}

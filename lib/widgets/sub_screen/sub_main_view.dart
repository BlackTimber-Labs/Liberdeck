import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SubMainView extends StatelessWidget {
  const SubMainView({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
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
          onTap: null,
          child: Container(
            height: height * 0.1,
            width: width * 0.2,
            decoration: BoxDecoration(
              color: Theme.of(context).buttonTheme.colorScheme!.background,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.02,
              vertical: height * 0.03,
            ),
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
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 1 : 1),
      mainAxisSpacing: height * 0.02,
      crossAxisSpacing: width * 0.04,
    );
  }
}

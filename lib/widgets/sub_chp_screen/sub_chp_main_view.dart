import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Root Widget of the Subject's Chapter Screen Main Component.
class SubChpMainView extends StatelessWidget {
  ///
  const SubChpMainView({
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
    final ScrollController _scrollController = ScrollController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: height * 0.07,
          //color: Colors.blueAccent,
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Subject Code',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        Container(
          height: height * 0.53,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.08,
          ),
          child: Container(
            //color: Colors.cyan,
            height: height * 0.44,
            child: ListView.builder(
              controller: _scrollController,
              itemBuilder: (BuildContext ctx, int i) => Material(
                elevation: 2,
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: height * 0.007,
                    ),
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Chapter',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.button,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: 8,
            ),
          ),
        ),
        Container(
          height: height * 0.05,
          decoration: const BoxDecoration(
            color: Colors.brown,
          ),
          width: width,
          child: IconButton(
            icon: const FaIcon(FontAwesomeIcons.chevronDown),
            onPressed: () async {
              // Delay to make sure the frames are rendered properly
              await Future<dynamic>.delayed(const Duration(milliseconds: 100));
              SchedulerBinding.instance?.addPostFrameCallback((_) {
                _scrollController.animateTo(
                  _scrollController.position.viewportDimension,
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.fastOutSlowIn,
                );
              });
            },
          ),
        ),
      ],
    );
  }
}

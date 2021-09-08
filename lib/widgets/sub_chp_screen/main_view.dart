import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: height * 0.07,
          //color: Colors.blueAccent,
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Subject Code",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        Container(
          height: height * 0.53,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.zero,
              bottomRight: Radius.zero,
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
              itemBuilder: (ctx, i) => Material(
                elevation: 2,
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                child: InkWell(
                  onTap: null,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: height * 0.007,
                    ),
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(
                      width * 0.07,
                    ),
                    child: Text(
                      "Chapter",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.button,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              itemCount: 8,
            ),
          ),
        ),
        Container(
          height: height * 0.04,
          decoration: BoxDecoration(
            color: Colors.brown,
          ),
          width: width,
          child: IconButton(
            icon: Icon(Icons.arrow_downward_rounded),
            onPressed: null,
          ),
        )
      ],
    );
  }
}


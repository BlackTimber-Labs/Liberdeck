import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:liberdeck/widgets/selection_screen/selection.dart';
import 'package:liberdeck/model/selection.dart';

class SelectionPage extends StatefulWidget {

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.65,
            child: Consumer<OptionsProvider>(
              builder: (
                  BuildContext context,
                  OptionsProvider options,
                  Widget? child,
                  ) {
                return ListView.builder(
                  itemBuilder: (
                      BuildContext ctx,
                      int i,
                      ) {
                    return Options();
                  },
                  // itemCount: departments.departmentList.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

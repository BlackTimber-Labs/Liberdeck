import 'package:flutter/material.dart';
import 'package:liberdeck/screens/selection_screen.dart';
import 'package:liberdeck/model/selection.dart';

class OptionsProvider with ChangeNotifier{
  final List<Options> _optionList = <Options>[
    Options(
      title:'IT',
    ),
    Options(
      title: 'CSE'
    ),
    Options(
        title: 'CCE'
    ),
    Options(
        title: 'DSE'
    ),
  ];
}
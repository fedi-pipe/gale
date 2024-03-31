import 'package:flutter/material.dart';
import 'package:gale/core/base.dart';
import 'package:gale/core/color.dart';
import 'package:gale/core/widget_base.dart';

class GaleText extends StatelessWidget with hasTextColor implements GaleWidget {
  @override
  late String text;

  @override
  late List<GalePredicate> predicates;

  GaleText({this.text = '', this.predicates = const [], super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: textColor));
  }
}

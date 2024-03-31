import 'package:flutter/material.dart';
import 'package:gale/core/base.dart';
import 'package:gale/core/color.dart';
import 'package:gale/core/widget_base.dart';

class GaleContainer extends StatelessWidget with hasBgColor implements GaleWidget {
  late Widget child;

  @override
  late List<GalePredicate> predicates;

  GaleContainer({this.child = GW.defaultChild, this.predicates = const [], super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: bgColor, child: child);
  }
}

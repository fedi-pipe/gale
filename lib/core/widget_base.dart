import 'package:flutter/material.dart';
import 'package:gale/core/base.dart';

class GaleWidget {
  late List<GalePredicate> predicates;

  GaleWidget({this.predicates = const []});

  static const defaultChild = GaleWidgetUnit();
  static const defaultColor = Colors.transparent;
}

typedef GW = GaleWidget;

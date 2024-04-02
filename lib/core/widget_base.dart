import 'package:flutter/material.dart';
import 'package:gale/core/base.dart';

typedef GaleWidgetPredicateGenerator<T extends GaleWidgetStyle> = List<GalePredicate> Function(T);

abstract class IGaleWidget {
  List<GalePredicate> get interpretedPredicates;
}

class GaleWidget<T extends GaleWidgetStyle> extends StatelessWidget {
  get interpretedPredicates => predicates == null ? predicates!(style!) : [];

  late GaleWidgetPredicateGenerator<T>? predicates;

  GaleWidget({this.predicates, this.style, super.key});

  T? style;

  static const defaultChild = GaleWidgetUnit();
  static const defaultColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

typedef GW = GaleWidget;

import 'package:flutter/material.dart';
import 'package:gale/core/base.dart';
import 'package:gale/core/color.dart';
import 'package:gale/core/widget_base.dart';

class GaleContainer extends StatelessWidget implements IGaleBgColor {
  late Widget child;

  double? width;
  double? height;

  late BoxShape shape;

  @override
  late List<GalePredicate> predicates;

  GaleContainer(
      {this.child = GW.defaultChild,
      this.predicates = const [],
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: child,
        decoration: BoxDecoration(
          color: bgColor,
          shape: shape,
        ),
        width: width,
        height: height);
  }
}

class GaleCircle extends GaleContainer {
  GaleCircle({Widget child = GW.defaultChild, List<GalePredicate> predicates = const [], required double radius})
      : super(child: child, predicates: predicates, shape: BoxShape.circle, width: radius, height: radius);
}

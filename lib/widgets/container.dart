import 'package:flutter/material.dart';
import 'package:gale/core/base.dart';
import 'package:gale/core/color.dart';
import 'package:gale/core/widget_base.dart';

class GaleBorderRadius extends GalePredicate {
  final BorderRadius value;

  GaleBorderRadius([this.value = GaleBorderRadius.defaultRadius]) : super(value);

  static const defaultRadius = BorderRadius.zero;
}

class GaleRounded {
  static get sm => GaleBorderRadius(BorderRadius.circular(8));
  static get md => GaleBorderRadius(BorderRadius.circular(16));
  static get lg => GaleBorderRadius(BorderRadius.circular(24));
  static get xl => GaleBorderRadius(BorderRadius.circular(32));
}

abstract class IGaleBorderRadius extends GaleWidget {}

extension BorderRadiusExtension on IGaleBorderRadius {
  BorderRadius get borderRadius =>
      predicates.lastWhere((e) => e is GaleBorderRadius, orElse: () => GaleBorderRadius()).value;
}

class GaleContainer extends StatelessWidget implements IGaleBgColor, IGaleBorderRadius {
  late Widget child;

  double? width;
  double? height;

  late BoxShape shape;

  @override
  late List<GalePredicate> predicates;

  get boxDecoration => shape == BoxShape.rectangle
      ? BoxDecoration(
          color: bgColor,
          shape: shape,
          borderRadius: borderRadius,
        )
      : BoxDecoration(
          color: bgColor,
          shape: shape,
        );

  GaleContainer(
      {this.child = GW.defaultChild,
      this.predicates = const [],
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: child, decoration: boxDecoration, width: width, height: height);
  }
}

class GaleCircle extends GaleContainer {
  GaleCircle({Widget child = GW.defaultChild, List<GalePredicate> predicates = const [], required double radius})
      : super(child: child, predicates: predicates, shape: BoxShape.circle, width: radius, height: radius);
}

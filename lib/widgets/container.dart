import 'package:flutter/material.dart';
import 'package:gale/core/base.dart';
import 'package:gale/core/color.dart';
import 'package:gale/core/widget_base.dart';
import 'package:gale/gale.dart';

class GaleBoxShadow extends GalePredicate {
  final List<BoxShadow> value;

  GaleBoxShadow([this.value = const []]) : super(value);
}

class GaleShadow {
  get sm => GaleBoxShadow([BoxShadow(blurRadius: 4, spreadRadius: 2, color: Colors.black.withOpacity(0.1))]);
  get md => GaleBoxShadow([BoxShadow(blurRadius: 8, spreadRadius: 4, color: Colors.black.withOpacity(0.1))]);
  get lg => GaleBoxShadow([BoxShadow(blurRadius: 16, spreadRadius: 8, color: Colors.black.withOpacity(0.1))]);
  get xl => GaleBoxShadow([BoxShadow(blurRadius: 24, spreadRadius: 12, color: Colors.black.withOpacity(0.1))]);
}

abstract class IGaleBoxShadow extends IGaleWidget {}

extension BoxShadowExtension on IGaleBoxShadow {
  List<BoxShadow> get boxShadow =>
      interpretedPredicates.lastWhere((e) => e is GaleBoxShadow, orElse: () => GaleBoxShadow()).value;
}

class GaleBorderRadius extends GalePredicate {
  final BorderRadius value;

  GaleBorderRadius([this.value = GaleBorderRadius.defaultRadius]) : super(value);

  static const defaultRadius = BorderRadius.zero;
}

class GaleRounded {
  GaleBorderRadius sm = GaleBorderRadius(BorderRadius.circular(8));
  GaleBorderRadius md = GaleBorderRadius(BorderRadius.circular(16));
  GaleBorderRadius lg = GaleBorderRadius(BorderRadius.circular(24));
  GaleBorderRadius xl = GaleBorderRadius(BorderRadius.circular(32));
}

abstract class IGaleBorderRadius extends IGaleWidget {}

extension BorderRadiusExtension on IGaleBorderRadius {
  BorderRadius get borderRadius =>
      interpretedPredicates.lastWhere((e) => e is GaleBorderRadius, orElse: () => GaleBorderRadius()).value;
}

class GaleContainerStyle extends GaleWidgetStyle {
  const GaleContainerStyle();

  GaleColorBg get bg => GaleColorBg();
  GaleRounded get rounded => GaleRounded();
  GaleShadow get shadow => GaleShadow();
}

typedef GaleContainerPredicateGenerator<T extends GaleWidgetStyle> = GaleWidgetPredicateGenerator<T>;

/// Wrapper class for Container widget
///
/// This class is a wrapper for Container widget.
/// It provides a simple way to create a container based on predicates.
///
/// Available predicates:
/// - [GaleColorBg]
/// - [GaleBorderRadius]
/// - [GaleBoxShadow]
class GaleContainer extends GaleWidget<GaleContainerStyle> implements IGaleBgColor, IGaleBoxShadow, IGaleBorderRadius {
  late Widget child;

  double? width;
  double? height;

  late BoxShape shape;

  @override
  late GaleWidgetPredicateGenerator<GaleContainerStyle>? predicates;

  @override
  final GaleContainerStyle style;

  @override
  get interpretedPredicates => predicates != null && style != null ? predicates!(style!) : [];

  get boxDecoration => shape == BoxShape.rectangle
      ? BoxDecoration(
          color: bgColor,
          shape: shape,
          boxShadow: boxShadow,
          borderRadius: borderRadius,
        )
      : BoxDecoration(
          color: bgColor,
          shape: shape,
          boxShadow: boxShadow,
        );

  GaleContainer(
      {this.child = GW.defaultChild,
      this.predicates = null,
      this.style = const GaleContainerStyle(),
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: child, decoration: boxDecoration, width: width, height: height);
  }
}

/// Wrapper class for [Container] widget with circle shape
///
/// Available predicates: Same as [GaleContainer]
class GaleCircle extends GaleContainer {
  GaleCircle(
      {Widget child = GW.defaultChild,
      GaleWidgetPredicateGenerator<GaleContainerStyle>? predicates = null,
      required double radius})
      : super(child: child, predicates: predicates, shape: BoxShape.circle, width: radius, height: radius);
}

import 'package:flutter/material.dart';
import 'package:gale/core/base.dart';
import 'package:gale/core/color.dart';
import 'package:gale/core/widget_base.dart';

class GaleFont {
  get thin => _GaleFontWeight(FontWeight.w100);
  get extraLight => _GaleFontWeight(FontWeight.w200);
  get light => _GaleFontWeight(FontWeight.w300);
  get normal => _GaleFontWeight(FontWeight.w400);
  get medium => _GaleFontWeight(FontWeight.w500);
  get semibold => _GaleFontWeight(FontWeight.w600);
  get bold => _GaleFontWeight(FontWeight.w700);
  get extrabold => _GaleFontWeight(FontWeight.w800);
  get black => _GaleFontWeight(FontWeight.w900);
}

class _GaleFontWeight extends GalePredicate {
  @override
  final FontWeight value;

  _GaleFontWeight([this.value = FontWeight.normal]) : super(value);
}

class GaleFontWeight {
  get w100 => _GaleFontWeight(FontWeight.w100);
  get w200 => _GaleFontWeight(FontWeight.w200);
  get w300 => _GaleFontWeight(FontWeight.w300);
  get w400 => _GaleFontWeight(FontWeight.w400);
  get w500 => _GaleFontWeight(FontWeight.w500);
  get w600 => _GaleFontWeight(FontWeight.w600);
  get w700 => _GaleFontWeight(FontWeight.w700);
  get w800 => _GaleFontWeight(FontWeight.w800);
  get w900 => _GaleFontWeight(FontWeight.w900);
}

class _GaleFontSize extends GalePredicate {
  @override
  final double value;

  _GaleFontSize([this.value = 14.0]) : super(value);
}

class GaleFontSize {
  get xxs => _GaleFontSize(12.0);
  get xs => _GaleFontSize(14.0);
  get s => _GaleFontSize(16.0);
  get m => _GaleFontSize(18.0);
  get l => _GaleFontSize(20.0);
  get xl => _GaleFontSize(24.0);
  get xxl => _GaleFontSize(28.0);
  get xxxl => _GaleFontSize(32.0);
  get xxxxl => _GaleFontSize(36.0);
  get xxxxxl => _GaleFontSize(40.0);
  get xxxxxxl => _GaleFontSize(44.0);
}

abstract class IGaleFontSize extends IGaleWidget {}

abstract class IGaleFontWeight extends IGaleWidget {}

extension FontSizeExtension on IGaleFontSize {
  double get fontSize =>
      interpretedPredicates.lastWhere((e) => e is _GaleFontSize, orElse: () => _GaleFontSize()).value;
}

extension FontWeightExtension on IGaleFontWeight {
  FontWeight get fontWeight =>
      interpretedPredicates.lastWhere((e) => e is _GaleFontWeight, orElse: () => _GaleFontWeight()).value;
}

class GaleTextStyle extends GaleWidgetStyle {
  GaleTextStyle();

  GaleFontSize get fontSize => GaleFontSize();
  GaleFont get fontWeight => GaleFont();
  GaleColorText get textColor => GaleColorText();
}

class GaleText extends GaleWidget<GaleTextStyle> implements IGaleFontSize, IGaleFontWeight, IGaleTextColor {
  @override
  late String text;

  @override
  late GaleWidgetPredicateGenerator<GaleTextStyle>? predicates;

  @override
  get interpretedPredicates => predicates == null ? predicates!.call(style!) : [];

  GaleText({this.text = '', this.predicates, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: textColor, fontWeight: fontWeight, fontSize: fontSize));
  }
}

class GaleTypography extends GaleText {
  GaleTypography({String text = '', GaleWidgetPredicateGenerator<GaleTextStyle>? predicates})
      : super(text: text, predicates: predicates);

  static List<GalePredicate> ensure(GaleWidgetPredicateGenerator<GaleTextStyle>? predicates, GaleTextStyle? style) =>
      predicates == null ? predicates!(style!) : [];

  static h1({String text = '', GaleWidgetPredicateGenerator<GaleTextStyle>? predicates}) => GaleTypography(
      text: text, predicates: (style) => [style.fontSize.xxxxl, style.fontWeight.bold, ...ensure(predicates, style)]);
  static h2({String text = '', GaleWidgetPredicateGenerator<GaleTextStyle>? predicates}) => GaleTypography(
      text: text, predicates: (style) => [style.fontSize.xxxl, style.fontWeight.bold, ...ensure(predicates, style)]);
  static h3({String text = '', GaleWidgetPredicateGenerator<GaleTextStyle>? predicates}) => GaleTypography(
      text: text, predicates: (style) => [style.fontSize.xxl, style.fontWeight.bold, ...ensure(predicates, style)]);
  static h4({String text = '', GaleWidgetPredicateGenerator<GaleTextStyle>? predicates}) => GaleTypography(
      text: text, predicates: (style) => [style.fontSize.xl, style.fontWeight.bold, ...ensure(predicates, style)]);
  static h5({String text = '', GaleWidgetPredicateGenerator<GaleTextStyle>? predicates}) => GaleTypography(
      text: text, predicates: (style) => [style.fontSize.l, style.fontWeight.bold, ...ensure(predicates, style)]);
  static h6({String text = '', GaleWidgetPredicateGenerator<GaleTextStyle>? predicates}) => GaleTypography(
      text: text, predicates: (style) => [style.fontSize.m, style.fontWeight.bold, ...ensure(predicates, style)]);
  static subtitle1({String text = '', GaleWidgetPredicateGenerator<GaleTextStyle>? predicates}) => GaleTypography(
      text: text, predicates: (style) => [style.fontSize.s, style.fontWeight.normal, ...ensure(predicates, style)]);
  static subtitle2({String text = '', GaleWidgetPredicateGenerator<GaleTextStyle>? predicates}) => GaleTypography(
      text: text, predicates: (style) => [style.fontSize.xs, style.fontWeight.normal, ...ensure(predicates, style)]);
  static body1({String text = '', GaleWidgetPredicateGenerator<GaleTextStyle>? predicates}) => GaleTypography(
      text: text, predicates: (style) => [style.fontSize.s, style.fontWeight.normal, ...ensure(predicates, style)]);
  static body2({String text = '', GaleWidgetPredicateGenerator<GaleTextStyle>? predicates}) => GaleTypography(
      text: text, predicates: (style) => [style.fontSize.xs, style.fontWeight.normal, ...ensure(predicates, style)]);
}

final textWidget =
    GaleTypography.h1(text: 'Hello World', predicates: (style) => [style.textColor.black, style.fontSize.xxl]);

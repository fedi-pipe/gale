import 'package:flutter/material.dart';
import 'package:gale/core/base.dart';

class GaleColor extends GalePredicate {
  @override
  final Color value;

  GaleColor([this.value = GaleColor.defaultColor]) : super(value);

  static const defaultColor = Colors.transparent;
  static const defaultTextColor = Colors.black;
}

class GaleColorBg extends GaleColor {
  GaleColorBg([Color value = GaleColor.defaultColor]) : super(value);

  static get white => GaleColorBg(Colors.white);
  static get black => GaleColorBg(Colors.black);
  static get red => GaleColorBg(Colors.red);
  static get green => GaleColorBg(Colors.green);
  static get blue => GaleColorBg(Colors.blue);
}

class GaleColorText extends GaleColor {
  GaleColorText([Color value = GaleColor.defaultTextColor]) : super(value);

  static get white => GaleColorText(Colors.white);
  static get black => GaleColorText(Colors.black);
  static get red => GaleColorText(Colors.red);
  static get green => GaleColorText(Colors.green);
  static get blue => GaleColorText(Colors.blue);
}

mixin hasBgColor {
  late List<GalePredicate> predicates;

  Color get bgColor => predicates.lastWhere((e) => e is GaleColorBg, orElse: () => GaleColorBg()).value;
}

mixin hasTextColor {
  late List<GalePredicate> predicates;

  Color get textColor => predicates.lastWhere((e) => e is GaleColorText, orElse: () => GaleColorText()).value;
}
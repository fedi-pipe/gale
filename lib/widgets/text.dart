import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gale/core/base.dart';
import 'package:gale/core/color.dart';
import 'package:gale/core/widget_base.dart';

class GaleFont {
  static get thin => GaleFontWeight(FontWeight.w100);
  static get extraLight => GaleFontWeight(FontWeight.w200);
  static get light => GaleFontWeight(FontWeight.w300);
  static get normal => GaleFontWeight(FontWeight.w400);
  static get medium => GaleFontWeight(FontWeight.w500);
  static get semibold => GaleFontWeight(FontWeight.w600);
  static get bold => GaleFontWeight(FontWeight.w700);
  static get extrabold => GaleFontWeight(FontWeight.w800);
  static get black => GaleFontWeight(FontWeight.w900);
}

class GaleFontWeight extends GalePredicate {
  @override
  final FontWeight value;

  GaleFontWeight([this.value = FontWeight.normal]) : super(value);

  static get w100 => GaleFontWeight(FontWeight.w100);
  static get w200 => GaleFontWeight(FontWeight.w200);
  static get w300 => GaleFontWeight(FontWeight.w300);
  static get w400 => GaleFontWeight(FontWeight.w400);
  static get w500 => GaleFontWeight(FontWeight.w500);
  static get w600 => GaleFontWeight(FontWeight.w600);
  static get w700 => GaleFontWeight(FontWeight.w700);
  static get w800 => GaleFontWeight(FontWeight.w800);
  static get w900 => GaleFontWeight(FontWeight.w900);
}

mixin hasFontWeight {
  late List<GalePredicate> predicates;
class GaleFontSize extends GalePredicate {
  @override
  final double value;

  GaleFontSize([this.value = 14.0]) : super(value);

  static get xxs => GaleFontSize(12.0.r);
  static get xs => GaleFontSize(14.0.r);
  static get s => GaleFontSize(16.0.r);
  static get m => GaleFontSize(18.0.r);
  static get l => GaleFontSize(20.0.r);
  static get xl => GaleFontSize(24.0.r);
  static get xxl => GaleFontSize(28.0.r);
  static get xxxl => GaleFontSize(32.0.r);
  static get xxxxl => GaleFontSize(36.0.r);
  static get xxxxxl => GaleFontSize(40.0.r);
  static get xxxxxxl => GaleFontSize(44.0.r);
}

  FontWeight get fontWeight => predicates.lastWhere((e) => e is GaleFontWeight, orElse: () => GaleFontWeight()).value;
}

class GaleText extends StatelessWidget with hasTextColor, hasFontWeight implements GaleWidget {
  @override
  late String text;

  @override
  late List<GalePredicate> predicates;

  GaleText({this.text = '', this.predicates = const [], super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: textColor, fontWeight: fontWeight));
  }
}

import 'package:flutter/material.dart';

abstract class GalePredicate {
  final dynamic value;
  GalePredicate(this.value);
}

abstract class GaleWidgetStyle {
  GaleWidgetStyle();
}

class GaleWidgetUnit extends StatelessWidget {
  const GaleWidgetUnit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

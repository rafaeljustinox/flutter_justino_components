import 'package:flutter/material.dart';

class BehaviorWithoutGlow extends ScrollBehavior {
  const BehaviorWithoutGlow();
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

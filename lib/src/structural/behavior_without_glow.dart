import 'package:flutter/material.dart';

class BehaviorWithoutGlow extends ScrollBehavior {
  const BehaviorWithoutGlow();
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}

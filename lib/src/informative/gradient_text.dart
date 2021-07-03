import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  GradientText({
    required this.text,
    required this.gradient,
  });

  final Widget text;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      
      shaderCallback: (bounds) {
        return gradient.createShader(Offset.zero & bounds.size);
      },
      child: this.text
    );
  }
}
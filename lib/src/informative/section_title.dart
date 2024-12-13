import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String? title;
  final AlignmentGeometry alignment;

  const SectionTitle({
    Key? key,
    this.title,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.only(top: 2, bottom: 15, left: 24.0, right: 24.0),
        child: Text(title!,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w900)),
      ),
    );
  }
}

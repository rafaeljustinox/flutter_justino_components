import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 2, bottom: 15, left: 24.0, right: 24.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6.copyWith(
            fontWeight: FontWeight.w900
          )
        ),
      ),
    );
  }
}
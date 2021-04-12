import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final Color color;

  const PageTitle({
    Key key,
    this.title,
    this.fontWeight,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, bottom: 16.0),
        child: Wrap(
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline4.copyWith(
                height: 1.2,
                fontWeight: fontWeight,
                color: color
              )
            ),
          ],
        ),
      ),
    );
  }
}
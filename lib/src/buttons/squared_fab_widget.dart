import 'package:flutter/material.dart';

class SquaredFabWidget extends StatelessWidget {

  final Function onPressed;
  final Widget content;
  final String heroTag;

  const SquaredFabWidget({Key key, this.onPressed, this.content, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 58.0,
      height: 58.0,
      child: FloatingActionButton(
        heroTag: heroTag != null ? heroTag : 'fab',
        backgroundColor: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
          //borderRadius:  BorderRadius.only(topLeft: Radius.circular(32.0)),
        ),
        onPressed: onPressed,
        child: content
      ),
    );
  }
}
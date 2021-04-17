import 'package:flutter/material.dart';

class CornerFloatingActionButton extends StatelessWidget {
  final Function? onPressed;
  final String? heroTag;
  const CornerFloatingActionButton({
    Key? key,
    this.onPressed,
    this.heroTag
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      right: 0.0,
      child: Material(
        color: Colors.transparent,
        child:
        Hero(
          tag: heroTag!,
          child: ButtonTheme.fromButtonThemeData(
            data: ButtonThemeData(
              minWidth: 32.0,
              height: 82.0,
            ),
            child: 
            Container(
              /* child: RaisedButton(
                onPressed: onPressed,
                shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.only(topLeft: Radius.circular(32.0)),
                ),
                color: Theme.of(context).accentColor,
                splashColor: Colors.white10,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 36.0,
                )
              ), */
              child: ElevatedButton(
                onPressed: onPressed as void Function()?,
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.only(topLeft: Radius.circular(32.0)),
                  ),
                ),
                //splashColor: Colors.white10,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 36.0,
                )
              ),
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.only(topLeft: Radius.circular(32.0)),
                boxShadow: <BoxShadow>[
                  /* BoxShadow(
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    offset: Offset(-16.0, 10.0),
                    color: Colors.grey.withAlpha(160),
                  ) */
                ],
              ),
            ), 
          )
        ),
      ),
    );
  }
}
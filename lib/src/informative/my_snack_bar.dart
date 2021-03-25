import 'package:flutter/material.dart';

class MySnackBar extends SnackBar {
  
  static create(
    String title,
    String body,
    String type,
    BuildContext context,
    { Duration duration : const Duration(seconds: 4) }) {

    Color color;
    if ( type == 'info' ) color = Colors.lightBlue.shade200;
    if ( type == 'warning' ) color = Colors.yellowAccent.shade700;
    if ( type == 'error' ) color = Colors.pinkAccent.shade200;

    return  SnackBar(
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.fixed,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0))),
      duration: duration,
      content: Wrap(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 0.0, bottom: 6.0),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: color,
              ),
              
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 6.0),
            child: Wrap(
              children: <Widget>[
                Text(
                  body,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }

  static show(
    GlobalKey<ScaffoldState> key,
    String title,
    String body,
    String type,
    { Duration duration : const Duration(seconds: 4) }) {
    
    if ( key != null ) {
      key.currentState.showSnackBar(
        MySnackBar.create(title, body, type, key.currentContext, duration: duration)
      );
    } else {
      print('Snackbar não foi mostrada pois a chave do Scaffold não foi informada');
    }
  }
}
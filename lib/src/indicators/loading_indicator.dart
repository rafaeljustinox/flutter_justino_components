import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final String text;
  const LoadingIndicator({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /* Padding(
            padding: EdgeInsets.all(10),
            child: SpinKitThreeBounce(
              color: Colors.black,
              size: 38.0,
            ) //CircularProgressIndicator(),
          ), */
          Padding(
            padding: EdgeInsets.all(10),
            child: Text( text ),
          ),
        ],
      ),
    );
  }
}
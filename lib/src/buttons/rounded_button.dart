import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final ClickCallback onUserClick;
  final String text;
  final Icon icon;
  final BorderRadius _border =  BorderRadius.circular(16.0);
  final Color backgroundColor = Colors.black;
  RoundedButton({
    @required this.onUserClick,
    @required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return 
    Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 56.0,
            child: 
              icon != null
            ? RaisedButton.icon(
              color: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: _border,
              ),
              onPressed: () {
                onUserClick();
              },
              icon: icon,
              label: Text(
                text,
                style: Theme.of(context).textTheme.button.copyWith(
                  color: Colors.white
                )
              ),
            )
            : FlatButton(
              color: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: _border,
                //side: BorderSide(color: Colors.grey)
              ),
              onPressed: () {
                onUserClick();
              },
              child: Text(
                text,
                style: Theme.of(context).textTheme.button.copyWith(
                  color: Colors.white
                )
              ),
            )
          ),
        )
      ],
    );
  }
}

typedef ClickCallback = void Function();
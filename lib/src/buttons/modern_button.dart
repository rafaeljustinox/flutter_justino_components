import 'package:flutter/material.dart';

class ModernButton extends StatelessWidget {

  final VoidCallback? onPressed;
  final String? text;
  final Icon? icon;
  final BorderRadius _border =  BorderRadius.circular(16.0);
  final Color? backgroundColor;
  final FontWeight? fontWeight;
  ModernButton({
    this.onPressed,
    this.text,
    this.icon,
    this.backgroundColor,
    this.fontWeight
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
            ? ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: backgroundColor ?? Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: _border,
                  ),
                  //disabledColor: Theme.of(context).disabledColor,
                ),
                onPressed: onPressed,
                icon: icon!,
                label: Text(
                  text!,
                  style: Theme.of(context).textTheme.button!.copyWith(
                    color: Colors.white,
                    fontWeight: fontWeight
                  )
                ),
              )
            : ElevatedButton(
              style: TextButton.styleFrom(
                primary: backgroundColor ?? Theme.of(context).accentColor,
                //disabledColor: Theme.of(context).disabledColor,
                shape: RoundedRectangleBorder(
                  borderRadius: _border,
                  //side: BorderSide(color: Colors.grey)
                ),
              ),
              onPressed: onPressed,
              child: Text(
                text!,
                style: Theme.of(context).textTheme.button!.copyWith(
                  color: Colors.white,
                  fontWeight: fontWeight
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
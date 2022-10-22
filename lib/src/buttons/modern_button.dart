import 'package:flutter/material.dart';

class ModernButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Icon? icon;
  final BorderRadius _border = BorderRadius.circular(16.0);
  final Color? backgroundColor;
  final FontWeight? fontWeight;
  final double? elevation;
  ModernButton({
    this.onPressed,
    this.text,
    this.icon,
    this.backgroundColor,
    this.fontWeight,
    this.elevation = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
              height: 56.0,
              child: icon != null
                  ? ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        elevation: this.elevation,
                        backgroundColor: backgroundColor ??
                            Theme.of(context).colorScheme.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: _border,
                        ),
                        //disabledColor: Theme.of(context).disabledColor,
                      ),
                      onPressed: onPressed,
                      icon: icon!,
                      label: Text(text!,
                          style: Theme.of(context).textTheme.button!.copyWith(
                              color: Colors.white, fontWeight: fontWeight)),
                    )
                  : ElevatedButton(
                      style: TextButton.styleFrom(
                        foregroundColor: backgroundColor ??
                            Theme.of(context).colorScheme.secondary,
                        elevation: this.elevation,
                        //disabledColor: Theme.of(context).disabledColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: _border,
                          //side: BorderSide(color: Colors.grey)
                        ),
                      ),
                      onPressed: onPressed,
                      child: Text(text!,
                          style: Theme.of(context).textTheme.button!.copyWith(
                              color: Colors.white, fontWeight: fontWeight)),
                    )),
        )
      ],
    );
  }
}

typedef ClickCallback = void Function();

import 'package:flutter/material.dart';

class HideKeyboardOnTap extends StatefulWidget {

  final Widget child;

  const HideKeyboardOnTap({Key key, this.child}) : super(key: key);

  @override
  _HideKeyboardOnTapState createState() => _HideKeyboardOnTapState();
}

class _HideKeyboardOnTapState extends State<HideKeyboardOnTap> {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { FocusScope.of(context).unfocus(); },
      child: widget.child
    );
  }
}

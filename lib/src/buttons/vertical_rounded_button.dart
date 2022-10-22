import 'package:flutter/material.dart';

class VerticalRoundedButton extends StatelessWidget {
  final Function? onPressed;
  final bool isDark;
  VerticalRoundedButton({Key? key, this.onPressed, this.isDark = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double radius = 14.0;
    return Padding(
      padding: EdgeInsets.only(left: 18.0, right: 24.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.16,
        width: 52.0,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            padding: EdgeInsets.all(0.0),
            backgroundColor:
                isDark ? Theme.of(context).cardColor : Colors.grey.shade200,
            //color: Theme.of(context).primaryColor.withOpacity(0.10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          onPressed: onPressed as void Function()?,
          child: Icon(
            Icons.add,
            size: 32.0,
            color: Theme.of(context).primaryColor, //Colors.blueAccent.shade700,
          ),
        ),
      ),
    );
  }
}

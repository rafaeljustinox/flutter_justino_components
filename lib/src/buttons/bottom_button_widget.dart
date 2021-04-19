import 'package:flutter/material.dart';

class BottomButtonWidget extends StatelessWidget {
  final Function? onPressed;
  final String? text;
  final String? heroTag;
  const BottomButtonWidget({Key? key, this.onPressed, this.text, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      Positioned(
        bottom: 0.0,
        left: -32.0,
        right: -32.0,
        child: Material(
          child: Hero(
            tag: this.heroTag != null ? this.heroTag! : 'bottomButtomWidget',
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0)
                  ),
                ),
              ),
              onPressed: this.onPressed as void Function()?,//_handleSave,
              //splashColor: Colors.white10,
              child: SizedBox(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.1,//82.0,
                child: Center(
                  child: Text(
                    this.text!,
                    style: Theme.of(context).textTheme.button!.copyWith(
                      color: Colors.white, //Theme.of(context).backgroundColor,
                    )
                  ),
                )
              ),
          ),
          ),
        ),
      );
  }
}
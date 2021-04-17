import 'package:flutter/material.dart';
import 'package:justino_components/src/inputs/custom_drop_down.dart';

enum ModernDropdownFieldTheme {
  dark,
  light,
}

class ModernDropdownField extends StatefulWidget {

  final Icon prefixIcon;
  final List<dynamic> items;
  final dynamic initialValue;
  final ValueChanged<dynamic> onChanged;
  final FontWeight labelWeight;
  final FontWeight textWeight;
  final ModernDropdownFieldTheme theme;
  final String labelText;
  final String hintText;

  const ModernDropdownField({
    Key key,
    this.prefixIcon,
    this.items,
    this.initialValue,
    this.onChanged,
    this.labelWeight,
    this.textWeight,
    this.theme,
    this.labelText,
    this.hintText,
  }) : super(key: key);

  @override
  _ModernDropdownFieldState createState() => _ModernDropdownFieldState();
}

class _ModernDropdownFieldState extends State<ModernDropdownField> {

  EdgeInsetsGeometry _buildPadding() {
    double right = 16.0;
    double left = 16.0;

    if (widget.prefixIcon != null) {
      left = 0.0;
    }
    return 
    EdgeInsets.only(
      left: left,
      right: right,
      top: 18.0,
      bottom: 18.0,
    );
  }
  Color _buildHintTextColor() {

    if (widget.theme == null || widget.theme == ModernDropdownFieldTheme.light) {
      return Theme.of(context).textTheme.bodyText1.color.withOpacity(0.4);
    } else {
      return Colors.white.withOpacity(0.4);
    }
    
  }
  Widget _buildPrefixIcon() {
    return 
    widget.prefixIcon != null
    ? Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 14.0,
        ),
        child: widget.prefixIcon,
      )
    : null;
  }
  
  Color _buildLabelTextColor() {

    if (widget.theme == null || widget.theme == ModernDropdownFieldTheme.light) {
      return Theme.of(context).textTheme.bodyText1.color;
    } else {
      return Colors.white;
    }
  }

  Widget _buildLabelText() {
    return 
    widget.labelText != null && widget.labelText.isNotEmpty
    ?  Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          widget.labelText,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
            fontWeight: widget.labelWeight != null ? widget.labelWeight : FontWeight.bold,
            color: _buildLabelTextColor()
          )
        ),
      )
    : SizedBox();
  }

  /* Color _buildFillColor() {

    if (widget.theme == null || widget.theme == ModernDropdownFieldTheme.light) {
      return Colors.black.withOpacity(0.05);
    } else {
      return Colors.white.withOpacity(0.2);
    }

  } */

  Color _buildTextColor() {

    if (widget.theme == null || widget.theme == ModernDropdownFieldTheme.light) {
      return Theme.of(context).textTheme.bodyText1.color;
    } else {
      return Colors.white;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: <Widget>[
        _buildLabelText(),
        Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            CustomDropdownButtonFormField(
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2.0
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).errorColor,
                    width: 2.0
                  ),
                ),
                labelStyle: Theme.of(context).textTheme.bodyText1,
                alignLabelWithHint: false,
                filled: true,
                //fillColor: _buildFillColor(),
                contentPadding: _buildPadding(),
                hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                  color:_buildHintTextColor()
                ),
                prefixIcon: _buildPrefixIcon(),
                isDense: true,
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                hintText: widget.hintText,
                border: InputBorder.none,
              ),
              value: widget.initialValue,
              icon: Icon(Icons.keyboard_arrow_down),
              items: widget.items,
              onChanged: widget.onChanged,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                height: 1.4,
                fontWeight: widget.textWeight != null ? widget.textWeight : FontWeight.normal,
                color: _buildTextColor()
              )
            )
          ]
        )
      ]
    );
  }
}

class ModernDropdownFieldItem<T> extends CustomDropdownMenuItem<T> {

  final T value;
  final VoidCallback onTap;

  const ModernDropdownFieldItem({
    Key key,
    this.onTap,
    this.value,
    @required Widget child,
  }) : assert(child != null),
        super(key: key, child: child);
}

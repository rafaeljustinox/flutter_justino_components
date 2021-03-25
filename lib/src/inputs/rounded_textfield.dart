import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {

  final String text;
  final String labelText;
  final Icon icon;
  final TextEditingController ctr;
  final bool obscure;
  final IconButton suffixIcon;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final Function onTap;
  final Function onEditingComplete;
  final FocusNode focusNode;
  final int maxLength;
  final TextInputAction textInputAction;
  final Function onChanged;
  final EdgeInsets scrollPadding;

  RoundedTextField({
    @required this.ctr,
    this.text,
    this.labelText,
    this.icon,
    this.obscure,
    this.suffixIcon,
    this.keyboardType,
    this.textCapitalization,
    this.onTap,
    this.maxLength,
    this.onEditingComplete,
    this.focusNode,
    this.textInputAction,
    this.onChanged,
    this.scrollPadding
  });

  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          this.labelText != null && labelText.isNotEmpty
          ? Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
            child: Text(
              this.labelText,
              style: Theme.of(context).textTheme.subtitle1
            ),
          )
          : Container(),
          TextFormField(
            scrollPadding: scrollPadding != null ? scrollPadding : EdgeInsets.all(20.0),
            textInputAction: this.textInputAction != null ? this.textInputAction : TextInputAction.go,
            focusNode: this.focusNode != null ? this.focusNode :  FocusNode(),
            onEditingComplete: this.onEditingComplete != null ? this.onEditingComplete : (){
              FocusScope.of(context).requestFocus(FocusNode());
            },
            onChanged: onChanged,
            obscureText: obscure != null ? obscure : false,
            controller: ctr,
            keyboardType: keyboardType != null ? keyboardType : TextInputType.text,
            textCapitalization: textCapitalization != null ? textCapitalization : TextCapitalization.none,
            decoration: InputDecoration(
              hintText: text,
              contentPadding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 18.0),
              hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Theme.of(context).primaryColor.withOpacity(0.4)
              ),
              filled: true,
              prefixIcon:
              icon != null
              ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: icon
              )
              : null,
              suffixIcon: 
              suffixIcon != null
              ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: suffixIcon
              )
              : null,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                  color: Theme.of(context).accentColor,
                  width: 2.0
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none,
              ),
            ),
            onTap: () {

              if (this.onTap != null) {
                this.onTap();
              }
            },
            maxLength: this.maxLength != null ? this.maxLength : null,
          )
        ],
      ),
    );
  }
}
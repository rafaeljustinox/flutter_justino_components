import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ModernTextFieldTheme {
  dark,
  light,
}

class ModernTextField extends StatefulWidget {

  final Key key;
  final TextEditingController controller;
  final String initialValue;
  final FocusNode focusNode;

  final FontWeight labelWeight;
  final FontWeight textWeight;
  final ModernTextFieldTheme theme;

  //final InputDecoration decoration = const InputDecoration();
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextStyle style;
  final StrutStyle strutStyle;
  final TextDirection textDirection;
  final TextAlign textAlign = TextAlign.start;
  final TextAlignVertical textAlignVertical;
  final bool autofocus;// = false;
  final bool readOnly;//  = false;
  final ToolbarOptions toolbarOptions;
  final bool showCursor;
  final bool obscureText; // = false;
  final bool autocorrect; // = true;
  final bool enableSuggestions; // = true;
  final bool autovalidate; // = false;
  final bool maxLengthEnforced; // = true;
  final int maxLines;// = 1;
  final int minLines;
  final bool expands;//  = false;
  final int maxLength;
  final ValueChanged<String> onChanged;
  final GestureTapCallback onTap;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;// = true;
  final double cursorWidth = 2.0;
  final Radius cursorRadius;
  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection = true;
  final InputCounterWidgetBuilder buildCounter;

  final String labelText;
  final String errorText;
  final String hintText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final GestureTapCallback onSuffixTap;

  ModernTextField({
    this.key,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlignVertical,

    this.labelWeight,
    this.textWeight,
    this.theme,
    
    this.toolbarOptions,
    this.showCursor = true,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.buildCounter,
    this.labelText,
    this.errorText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    
    this.autofocus: false,
    this.readOnly: false,
    this.obscureText: false,
    this.autocorrect: true,
    this.enableSuggestions: true,
    this.maxLengthEnforced: true,
    this.autovalidate: false,
    this.maxLines: 1,
    this.expands: false,
    this.enabled: true,
    this.onSuffixTap,
    this.scrollPadding: const EdgeInsets.all(20.0),
    this.textCapitalization: TextCapitalization.none,

  }) : super(key: key);

  @override
  _ModernTextFieldState createState() => _ModernTextFieldState();
}

class _ModernTextFieldState extends State<ModernTextField> {

  EdgeInsetsGeometry _buildPadding() {
    double right = 16.0;
    double left = 16.0;

    if (widget.prefixIcon != null) {
      left = 0.0;
    }
    if (widget.suffixIcon != null) {
      right = 0.0;
    }
    return 
    EdgeInsets.only(
      left: left,
      right: right,
      top: 18.0,
      bottom: 18.0,
    );
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

  Widget _buildSuffixIcon() {

    return 
    widget.suffixIcon != null
    ? Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: ClipOval(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (widget.onSuffixTap != null) {
                  widget.onSuffixTap();
                }
              },
              child: SizedBox(
                width: 48.0,
                height: 48.0,
                child: widget.suffixIcon
              ),
            ),
          ),
        )
      )
    : null;
  }

  Color _buildLabelTextColor() {

    if (widget.theme == null || widget.theme == ModernTextFieldTheme.light) {
      return Theme.of(context).textTheme.bodyText1.color;
    } else {
      return Colors.white;
    }
    
  }

  Color _buildErrorTextColor() {

    if (widget.theme == null || widget.theme == ModernTextFieldTheme.light) {
      return Colors.red;
    } else {
      return Colors.red.shade100;
    }
    
  }

  Color _buildHintTextColor() {

    if (widget.theme == null || widget.theme == ModernTextFieldTheme.light) {
      return Theme.of(context).textTheme.bodyText1.color.withOpacity(0.4);
    } else {
      return Colors.white.withOpacity(0.4);
    }
    
  }

  Color _buildTextColor() {

    if (widget.theme == null || widget.theme == ModernTextFieldTheme.light) {
      return Theme.of(context).textTheme.bodyText1.color;
    } else {
      return Colors.white;
    }

  }

  Color _buildFillColor() {

    if (widget.theme == null || widget.theme == ModernTextFieldTheme.light) {
      return Colors.black.withOpacity(0.05);
    } else {
      return Colors.white.withOpacity(0.2);
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
            TextFormField(
              controller: widget.controller,
              initialValue: widget.initialValue,
              focusNode: widget.focusNode,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              textCapitalization: widget.textCapitalization,
              //style: widget.style,
              //strutStyle: widget.strutStyle,
              //textDirection: widget.textDirection,
              //textAlignVertical: widget.textAlignVertical,
              //toolbarOptions: widget.toolbarOptions,
              //showCursor: widget.showCursor,
              //minLines: widget.minLines,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              onEditingComplete: widget.onEditingComplete,
              onFieldSubmitted: widget.onFieldSubmitted,
              onSaved: widget.onSaved,
              validator: widget.validator,
              inputFormatters: widget.inputFormatters,
              //cursorRadius: widget.cursorRadius,
              //cursorColor: widget.cursorColor,
              keyboardAppearance: Theme.of(context).brightness,
            
              //buildCounter: widget.buildCounter,
              //autofocus: widget.autofocus,
              readOnly: widget.readOnly,
              obscureText: widget.obscureText,
              autocorrect: widget.autocorrect,
              enableSuggestions: widget.enableSuggestions,
              maxLengthEnforced: widget.maxLengthEnforced,
              autovalidate: widget.autovalidate,
              maxLines: widget.maxLines,
              expands: widget.expands,
              enabled: widget.enabled,
              scrollPadding: widget.scrollPadding,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                height: 1.4,
                fontWeight: widget.textWeight != null ? widget.textWeight : FontWeight.normal,
                color: _buildTextColor()
              ),
              key: widget.key,
              decoration: InputDecoration(
                hintText: widget.hintText,
                errorText: widget.errorText,
                errorStyle: Theme.of(context).textTheme.subtitle2.copyWith(
                  color: _buildErrorTextColor()
                ),
                filled: true,
                fillColor: _buildFillColor(),
                contentPadding: _buildPadding(),
                hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                  color:_buildHintTextColor()
                ),
                prefixIcon: _buildPrefixIcon(),
                suffixIcon: _buildSuffixIcon(),
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
              ),
            ),
          ],
        )
      ],
    );
    
    
    
    
  }
}
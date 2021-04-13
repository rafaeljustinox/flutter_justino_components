import 'package:flutter/material.dart';

class CornerButton extends StatefulWidget {
  final Function onPressed;
  final String heroTag;
  final bool isExpanded;
  final bool isVisible;
  final Widget expandedContent;
  final Widget collapsedContent;

  const CornerButton({
    Key key,
    this.heroTag,
    this.isExpanded = false,
    this.isVisible = true,
    @required this.onPressed,
    @required this.expandedContent,
    @required this.collapsedContent,
  }) : super(key: key);

  @override
  _CornerButtonState createState() => _CornerButtonState();
}

class _CornerButtonState extends State<CornerButton> {

  Widget _buildCornerButton() {
    double right = 0.0;
    double bottom = 0.0;
    double width = 100.0;

    if (widget.isExpanded) {
      right = -32.0;
      width = MediaQuery.of(context).size.width + 72.0;
      if (!widget.isVisible) {
        bottom = -86.0;
      }
    } else {
      right = -40.0;
      if (!widget.isVisible) {
        right = -110.0;
      }
    }

    return 
    AnimatedPositioned(
      bottom: bottom,
      right: right,
      width: width,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOutExpo,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        width: width,
        child: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular(32.0)            
          ),
          onPressed: widget.onPressed,
          child: _buildContent(widget.isVisible)
        ),
      ),
    );
  }

  Widget _buildContent(bool isExpanded) {
    if (widget.isExpanded){
      return Center(
        child: widget.expandedContent,
      );
    } else {
      return Center(
        child: widget.collapsedContent,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildCornerButton();
  }
}
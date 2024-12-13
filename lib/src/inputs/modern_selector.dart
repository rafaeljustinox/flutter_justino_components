import 'package:flutter/material.dart';
import 'package:justino_components/src/inputs/modern_selector_dialog.dart';
import 'package:justino_components/src/inputs/modern_selector_item.dart';

// ignore: must_be_immutable
class ModernSelector extends StatefulWidget { 
  final List<ModernSelectorItem> items;

  ModernSelectorItem selectedItem;

  final String? labelText;
  final Function? onChange;

  ModernSelector({
    Key? key,
    required this.items,
    required this.selectedItem,
    this.onChange,
    this.labelText,
  }) : super(key: key);

  @override
  _ModernSelectorState createState() => _ModernSelectorState(
    labelText: this.labelText,
    items: this.items,
    selectedItem: this.selectedItem,
  );
}

class _ModernSelectorState extends State<ModernSelector> {

  final List<ModernSelectorItem> items;
  ModernSelectorItem selectedItem;

  String? labelText;

  _ModernSelectorState({
    required this.selectedItem,
    required this.items,
    this.labelText
  });

  Future<void> showOptionsDialog() async {
    
    FocusScope.of(context).unfocus();
    await showDialog(
      context: context,
      barrierDismissible: true,
      //animationType: DialogTransitionType.fadeScale,
      //curve: Curves.fastLinearToSlowEaseIn,
      //duration: Duration(milliseconds: 400),
      builder: (context) => ModernSelectorDialog(
        title: this.labelText ?? null,
        items: widget.items,
        selectedItem: selectedItem,
        onCancel: (){
          Navigator.of(context).pop();
        },
        onConfirm: _onChange,
      )
    );
  }

  Future<void> _onChange(ModernSelectorItem item) async {
    setState((){
      selectedItem = item;
    });
    if (widget.onChange != null) {
      widget.onChange!(item);
    }
  }

  Widget _buildLabelText() {
    return 
    widget.labelText != null && widget.labelText!.isNotEmpty
    ? Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          widget.labelText!,
          style: Theme.of(context).textTheme.titleSmall!
        ),
      )
    : SizedBox();
  }

  Widget _buildContent() {

    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        _buildLabelText(),
        SizedBox(
          width: double.maxFinite,
          height: 56.0,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).hoverColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            onPressed: showOptionsDialog,
            child: Row(
              children: [
                if (selectedItem.leading != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 24.0,
                    height: 24.0,
                    child: Center(
                      child: selectedItem.leading
                    )
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      selectedItem.title,
                      style: Theme.of(context).textTheme.bodyLarge
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Theme.of(context).textTheme.bodyLarge!.color
                  ),
                )
              ],
            ),
          ) ,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}
import 'package:flutter/material.dart';
import 'package:justino_components/src/inputs/modern_selector_item.dart';

// ignore: must_be_immutable
class ModernSelectorDialog extends StatefulWidget {

  List<ModernSelectorItem> items;
  ModernSelectorItem selectedItem;
  final String? title;

  final Function?  onConfirm;
  final GestureTapCallback? onCancel;

  ModernSelectorDialog({
    Key? key,
    this.title,
    required this.items,
    required this.selectedItem,
    this.onCancel,
    this.onConfirm,
  }) : super(key: key);

  @override
  _ModernSelectorDialogState createState() => _ModernSelectorDialogState(
    this.selectedItem
  );

}

class _ModernSelectorDialogState extends State<ModernSelectorDialog> {

  late ModernSelectorItem selectedItem;

  _ModernSelectorDialogState(ModernSelectorItem selected) {
    selectedItem = selected;
  }

  void _onOptionSelected(ModernSelectorItem selectedItem) {
    setState(() {
      selectedItem = selectedItem;
    });
    widget.onConfirm!(selectedItem);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      contentPadding: const EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 0.0),
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)
      ),
      title: widget.title != null
      ? Container(
        color: Theme.of(context).dialogBackgroundColor,
        child: Text(
          widget.title!,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      )
      : null,
      content: Container(
        //width: 300,
        //height: 140,
        child: ListView(
          physics: ClampingScrollPhysics(),
          shrinkWrap: false,
          //padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          children: widget.items.map((item) {
            return Container(
              //width: 300,
              //height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(12.0),
                  color: selectedItem.id == item.id
                  ? Theme.of(context).hoverColor
                  : Theme.of(context).cardColor,
                ),
                child: ListTile(
                  onTap: () {
                    _onOptionSelected(item);
                  },
                  leading: item.leading,
                  title: Text(
                    item.title,
                    style: Theme.of(context).textTheme.bodyText1
                  ),
                  subtitle: Text(item.subtitle!),
                ),
              ),
            );
          }).toList(),
        )
      ),
    );
  }
}
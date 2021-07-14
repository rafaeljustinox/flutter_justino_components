import 'package:flutter/material.dart';
import 'package:justino_components/justino_components.dart';
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
      titlePadding: EdgeInsets.all(0),
      title: widget.title != null
      ? Container(
        decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          )
        ),
        padding: EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0, bottom: 12.0),
        child: Text(
          widget.title!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontWeight: FontWeight.bold
          ),
        ),
      )
      : null,
      content: ScrollConfiguration(
        behavior: BehaviorWithoutGlow(),
        child: SingleChildScrollView(
          child: ListBody(
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
                    : Theme.of(context).dialogBackgroundColor,
                  ),
                  child: item.subtitle != null 
                  ? ListTile(
                      onTap: () {
                        _onOptionSelected(item);
                      },
                      leading: item.leading,
                      title: Text(
                        item.title,
                        style: Theme.of(context).textTheme.bodyText1
                      ),
                      subtitle: Text(item.subtitle!),
                    )
                  : ListTile(
                      onTap: () {
                        _onOptionSelected(item);
                      },
                      leading: item.leading,
                      title: Text(
                        item.title,
                        style: Theme.of(context).textTheme.bodyText1
                      ),
                    )
                ),
              );
            }).toList()
          ),
        ),
      ),

      /* content: Container(
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
                  : Theme.of(context).dialogBackgroundColor,
                ),
                child: item.subtitle != null 
                ? ListTile(
                    onTap: () {
                      _onOptionSelected(item);
                    },
                    leading: item.leading,
                    title: Text(
                      item.title,
                      style: Theme.of(context).textTheme.bodyText1
                    ),
                    subtitle: Text(item.subtitle!),
                  )
                : ListTile(
                    onTap: () {
                      _onOptionSelected(item);
                    },
                    leading: item.leading,
                    title: Text(
                      item.title,
                      style: Theme.of(context).textTheme.bodyText1
                    ),
                  )
              ),
            );
          }).toList(),
        )
      ), */
    );
  }
}
import 'package:flutter/material.dart';
import '../enums.dart';

class ModernSnackbar {
  static _create({
    required BuildContext context,
    required String title,
    String body = '',
    ModernSnackbarType? type: ModernSnackbarType.info,
    Color? backgroundColor,
    Color? titleColor,
    Color? bodyColor,
    SnackBarAction? action,
    SnackBarBehavior? behavior: SnackBarBehavior.fixed,
    Duration? duration = const Duration(seconds: 4),
    ShapeBorder? shape,
  }) {
    // Checks if a background was informed
    backgroundColor = backgroundColor ??
        Theme.of(context).snackBarTheme.backgroundColor ??
        Colors.black;

    // Checks if titleColor was informed. Default is the info color
    if (titleColor == null) {
      if (type == ModernSnackbarType.info)
        titleColor = Colors.lightBlue.shade200;
      if (type == ModernSnackbarType.warning)
        titleColor = Colors.yellowAccent.shade700;
      if (type == ModernSnackbarType.error)
        titleColor = Colors.pinkAccent.shade200;
    }

    bodyColor = bodyColor ?? Colors.white;

    duration = duration ?? const Duration(seconds: 4);

    return SnackBar(
        backgroundColor: backgroundColor,
        behavior: behavior,
        action: action,
        shape: shape,
        duration: duration,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0.0, bottom: 6.0),
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: titleColor,
                    ),
              ),
            ),
            if (body.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(bottom: 6.0),
                child: Text(
                  body,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: bodyColor,
                      ),
                ),
              ),
          ],
        ));
  }

  static show(BuildContext context, String title, String body,
      {ModernSnackbarType? type,
      Color? backgroundColor,
      Color? titleColor,
      Color? bodyColor,
      SnackBarAction? action,
      SnackBarBehavior? behavior,
      Duration? duration,
      ShapeBorder? shape}) {
    ScaffoldMessenger.of(context).showSnackBar(ModernSnackbar._create(
        context: context,
        title: title,
        body: body,
        type: type,
        backgroundColor: backgroundColor,
        titleColor: titleColor,
        bodyColor: bodyColor,
        action: action,
        behavior: behavior,
        duration: duration,
        shape: shape));
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

myToast(
  String msg, {
  double fontSize = 13,
  ToastGravity toastGravity = ToastGravity.SNACKBAR,
  Toast toastLength = Toast.LENGTH_SHORT,
  Color? backgroundColor,
  Color? textColor,
  int timeInSecForIosWeb = 2,
  dynamic webBgColor,
  dynamic webPosition,
}) =>
    {
      if (!kIsWeb) Fluttertoast.cancel(),
      Fluttertoast.showToast(
          msg: msg,
          webShowClose: true,
          fontSize: fontSize,
          toastLength: toastLength,
          gravity: toastGravity,
          backgroundColor: backgroundColor,
          textColor: textColor,
          timeInSecForIosWeb: timeInSecForIosWeb,
          webBgColor: webBgColor,
          webPosition: webPosition),
    };

mySnakbar(BuildContext context, String msg, {bool showCloseIcon = true, Duration duration = const Duration(seconds: 2), Color closeIconColor = Colors.white}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      showCloseIcon: showCloseIcon,
      closeIconColor: closeIconColor,
      duration: duration,
      content: Text(msg),
      behavior: SnackBarBehavior.fixed,
      dismissDirection: DismissDirection.endToStart,
    ));

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

myToast(String msg, {double fontSize = 13, ToastGravity toastGravity = ToastGravity.SNACKBAR, Toast toastLength = Toast.LENGTH_SHORT}) => {
      Fluttertoast.cancel(),
      Fluttertoast.showToast(msg: msg, webShowClose: true, fontSize: fontSize, toastLength: toastLength, gravity: toastGravity),
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/root.dart';

myAppBar({
  required BuildContext context,
  String title = ROOT.institutionAbbreviation,
  double fontSize = 16,
  Color? foreground,
  Color? systemNavigationBarColor,
  Color? statusBarColor,
  Color? background,
  List<Widget>? actions,
  bool backbutton = true,
  bool centerTitle = false,
  SystemUiOverlayStyle? systemUiOverlayStyle,
}) =>
    AppBar(
        backgroundColor: (background != null) ? background : Colors.transparent,
        systemOverlayStyle: (systemUiOverlayStyle != null)
            ? systemUiOverlayStyle
            : SystemUiOverlayStyle(systemNavigationBarColor: systemNavigationBarColor, systemNavigationBarDividerColor: Colors.transparent, statusBarColor: statusBarColor),
        title: Text(title, textScaleFactor: 1, style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold, fontSize: fontSize)),
        foregroundColor: foreground,
        // actions: [IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.news, size: 18))],
        actions: actions,
        centerTitle: centerTitle,
        automaticallyImplyLeading: backbutton,
        titleSpacing: (backbutton) ? 0 : 15,
        toolbarHeight: 40,
        elevation: 0.0);

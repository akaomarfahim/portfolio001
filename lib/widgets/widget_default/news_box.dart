import 'package:flutter/material.dart';

import '../../utils/__colors.dart';

newsBox({
  void Function()? action,
  EdgeInsets margin = const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
  EdgeInsets marginInside = const EdgeInsets.all(4),
  Color? boxBackground = MyColors.newsPaper,
  double? elevation = 0,
  bool borderOnForeground = true,
  double borderRadius = 4,
  BorderSide borderSide = const BorderSide(color: Colors.black, width: 0.7, style: BorderStyle.solid),
  Color splashColor = MyColors.primary,
  Widget? widget,
}) =>
    Card(
      margin: margin,
      clipBehavior: Clip.antiAlias,
      color: boxBackground,
      elevation: elevation,
      borderOnForeground: borderOnForeground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius), side: borderSide),
      child: InkWell(
        onTap: action,
        splashColor: splashColor,
        child: Container(
          margin: marginInside,
          child: widget,
        ),
      ),
    );

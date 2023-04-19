import 'package:flutter/material.dart';

myListTile(
        {void Function()? action,
        double? height,
        double? weight,
        Color? splashColor,
        EdgeInsets? padding = const EdgeInsets.all(6),
        EdgeInsets? margin,
        double borderRadius = 4,
        double width = 0.5,
        Color borderColor = Colors.transparent,
        InteractiveInkFeatureFactory? splashFactory,
        List<Widget> column = const [],
        List<Widget> buttonRow = const []}) =>
    Card(
        clipBehavior: Clip.hardEdge,
        elevation: 1,
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        child: InkWell(
          onTap: action,
          splashColor: splashColor,
          splashFactory: splashFactory,
          child: Container(
              height: height,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius), border: Border.all(color: borderColor, style: BorderStyle.solid, width: width)),
              width: weight,
              padding: padding,
              margin: margin,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.start, children: column)),
                Row(children: buttonRow)
              ])),
        ));

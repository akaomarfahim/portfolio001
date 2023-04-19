import 'package:flutter/material.dart';
import '__text.dart';

myCheckBoxListBuilder({
  String? label,
  String? description,
  double? height,
  double? width = double.infinity,
  EdgeInsets? margin = const EdgeInsets.only(bottom: 6),
  EdgeInsets? padding,
  Color? activeColor = Colors.red,
  ScrollPhysics scrollPhysics = const NeverScrollableScrollPhysics(),
  VoidCallback? action,
  required Map<String, dynamic> listItems,
  bool enable = true,
  // label
  String? labelFontFamily = 'RobotoSlab',
  double? labelFontSize = 12,
  EdgeInsets labelPadding = const EdgeInsets.fromLTRB(4, 0, 0, 4),

  // Container Box
  Color? boxBackground = const Color.fromRGBO(245, 245, 245, 1),
  double borderRadius = 6,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) myText(label, fontFamily: labelFontFamily, alignment: Alignment.centerLeft, fontWeight: FontWeight.w500, fontsize: labelFontSize, padding: labelPadding),
        Container(
            padding: padding,
            margin: margin,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(color: boxBackground, borderRadius: BorderRadius.circular(borderRadius)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (description != null)
                myText(description,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w400,
                    padding: const EdgeInsets.fromLTRB(10, 10, 4, 4),
                    alignment: Alignment.centerLeft,
                    maxLines: 3,
                    fontsize: 10,
                    color: Colors.black54),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: listItems.length,
                  physics: scrollPhysics,
                  addAutomaticKeepAlives: true,
                  clipBehavior: Clip.none,
                  itemExtent: 28,
                  padding: const EdgeInsets.only(bottom: 6),
                  itemBuilder: (context, index) => CheckboxListTile(
                        enabled: enable,
                        tristate: false,
                        isThreeLine: false,
                        enableFeedback: true,
                        checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        contentPadding: EdgeInsets.zero,
                        value: listItems.values.elementAt(index),
                        onChanged: (value) {
                          listItems.update(listItems.keys.elementAt(index), (val) => value);
                          action!();

                          // userProfileAccessBool.update(userProfileAccessBool.keys.elementAt(index), (val) => value);
                          // newUserAccess = UserAccessModel.fromMap(userProfileAccessBool);
                        },
                        title: myText(listItems.keys.elementAt(index),
                            // maxFontSize: 12,
                            maxLines: 1,
                            // stepGranularity: 0.1,
                            textStyle: const TextStyle(fontFamily: 'RobotoSlab', color: Colors.black, fontWeight: FontWeight.w500, fontSize: 6)),
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: activeColor,
                        checkColor: Colors.white,
                      ))
            ]))
      ],
    );

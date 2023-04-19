import 'package:flutter/material.dart';

import '__text.dart';

myDropDownMenu({
  required String? value,
  String? hint,
  List<String> items = const [],
  required void Function(String?)? onChanged,
  double? height = 40,
  double fontSize = 10,
  // external Label
  bool showExternalLabel = true,
  String externalLabelText = '',
  String externalLabeFontFamily = '',
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showExternalLabel)
          myText((externalLabelText.isNotEmpty) ? externalLabelText : hint ?? '',
              alignment: Alignment.centerLeft, fontFamily: 'RobotoSlab', fontsize: 12, fontWeight: FontWeight.w500, padding: const EdgeInsets.fromLTRB(4, 0, 0, 4)),
        Container(
          width: double.infinity,
          height: height,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          margin: const EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(6)),
          child: DropdownButton<String>(
              isDense: true,
              elevation: 1,
              value: value,
              underline: Container(),
              hint: Text(hint ?? '', style: TextStyle(height: 0, fontSize: fontSize, color: Colors.black, fontWeight: FontWeight.w500, fontFamily: 'RobotoSlab')),
              isExpanded: true,
              borderRadius: BorderRadius.circular(6),
              items: items
                  .map((e) => DropdownMenuItem(
                      value: e,
                      enabled: true,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        child: Text(e,
                            textScaleFactor: 1, style: TextStyle(height: 0, fontSize: fontSize, color: Colors.black, fontWeight: FontWeight.w500, fontFamily: 'RobotoSlab')),
                      )))
                  .toList(),
              onChanged: onChanged),
        ),
      ],
    );

    // ['Male', 'Female', 'Non-Binary']

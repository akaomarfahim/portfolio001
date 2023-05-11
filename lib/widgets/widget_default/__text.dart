// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ROOTMyText {
  static TextStyle textStyle = const TextStyle(fontFamily: 'Rubik', fontWeight: FontWeight.w500, color: Colors.blue, fontStyle: FontStyle.normal);
  static Color textColor = Colors.lightBlue;
  static Color selectionColor = Colors.blue.withOpacity(0.3);
  static EdgeInsets padding = EdgeInsets.zero;
  static AlignmentGeometry alignment = Alignment.center;
}

class MyText extends StatefulWidget {
  AlignmentGeometry? alignment;
  Color? containerColor;
  EdgeInsets? padding;
  EdgeInsets? margin;
  double? height;
  double? width;
  // TextField
  String? label;
  bool? softWrap;
  bool textStyleEnforcement;
  TextStyle? textStyle;
  TextOverflow? textOverflow;
  double? textScaleFactor;
  Decoration? decoration;
  Color? selectionColor;
  TextAlign? textAlign;
  int? maxLines;
  // TextStyle
  String? fontFamily;
  double? fontSize;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  double? textHeight;
  double? letterSpacing;
  Color? textColor;
  Color? textBackgroundColor;
  TextDecoration? textDecoration;
  Color? textDecorationColor;
  TextDecorationStyle? textDecorationStyle;
  double? textDecorationThickness;

  MyText(this.label,
      {Key? key,
      this.alignment,
      this.containerColor,
      this.padding,
      this.margin,
      this.height,
      this.width,
      this.softWrap = true,
      this.textStyleEnforcement = false,
      this.textStyle,
      this.textOverflow,
      this.textScaleFactor,
      this.decoration,
      this.selectionColor,
      this.textAlign,
      this.maxLines,
      this.fontFamily,
      this.fontSize,
      this.fontWeight,
      this.fontStyle,
      this.textHeight,
      this.letterSpacing,
      this.textColor,
      this.textBackgroundColor,
      this.textDecoration,
      this.textDecorationColor,
      this.textDecorationStyle,
      this.textDecorationThickness})
      : super(key: key);

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  void initState() {
    super.initState();
    widget.textStyle ??= ROOTMyText.textStyle;
    widget.selectionColor ??= ROOTMyText.selectionColor;
    widget.padding ??= ROOTMyText.padding;
    widget.alignment ??= ROOTMyText.alignment;
    widget.textColor ??= ROOTMyText.textColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      alignment: widget.alignment,
      decoration: widget.decoration,
      margin: widget.margin,
      color: widget.containerColor,
      child: Text(widget.label ?? '',
          maxLines: widget.maxLines,
          softWrap: widget.softWrap,
          overflow: widget.textOverflow,
          textAlign: widget.textAlign,
          textScaleFactor: widget.textScaleFactor,
          selectionColor: widget.selectionColor,
          style: (widget.textStyle != null && widget.textStyleEnforcement)
              ? widget.textStyle
              : TextStyle(
                  fontFamily: widget.fontFamily,
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight,
                  fontStyle: widget.fontStyle,
                  height: widget.textHeight,
                  letterSpacing: widget.letterSpacing,
                  color: widget.textColor,
                  backgroundColor: widget.textBackgroundColor,
                  decoration: widget.textDecoration,
                  decorationColor: widget.textDecorationColor,
                  decorationStyle: widget.textDecorationStyle,
                  decorationThickness: widget.textDecorationThickness)),
    );
  }
}

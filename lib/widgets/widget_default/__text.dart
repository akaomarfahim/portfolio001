import 'package:flutter/material.dart';

class MyText extends StatefulWidget {
  final AlignmentGeometry? alignment;
  final Color? containerColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  // TextField
  final String? label;
  final bool? softWrap;
  final bool textStyleEnforcement;
  final TextStyle? textStyle;
  final TextOverflow? textOverflow;
  final double? textScaleFactor;
  final Decoration? decoration;
  final Color? selectionColor;
  final TextAlign? textAlign;
  final int? maxLines;
  // TextStyle
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? textHeight;
  final double? letterSpacing;
  final Color? textColor;
  final Color? textBackgroundColor;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final TextDecorationStyle? textDecorationStyle;
  final double? textDecorationThickness;

  const MyText(this.label,
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
      this.selectionColor = const Color.fromARGB(150, 33, 150, 243),
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
      this.textDecorationThickness,
      this.textAlign})
      : super(key: key);

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
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

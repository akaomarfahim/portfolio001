// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '__loadings.dart';

myButton({
  Widget? label,
  bool isLoadingComplete = true,
  IconData? icon,
  Color? iconColor,
  Color? foreground = Colors.white,
  Color? background = Colors.blueGrey,
  Color? disabledForeground = Colors.white38,
  Color? disabledBackground = Colors.black38,
  Color borderColor = Colors.transparent,
  Color? shadowColor = Colors.transparent,
  double? iconSize = 18,
  double? height = 35,
  double? width = double.infinity,
  double elevation = 2,
  double? borderRadius,
  double borderWidth = 0,
  // double? fontSize = 14,
  // String? fontfamily = 'Roboto',
  // FontWeight fontWeight = FontWeight.w500,
  EdgeInsets? margin,
  EdgeInsets? buttonPadding,
  VoidCallback? action,
  BorderRadiusGeometry? borderRadiusGeometry,
  InteractiveInkFeatureFactory splashFactory = InkSparkle.constantTurbulenceSeedSplashFactory,
  OutlinedBorder? shape,

  // // Text
  // double? height,
  // double? width,
  // EdgeInsets? padding,
  // EdgeInsets? margin,
  // AlignmentGeometry alignment = Alignment.center,
  // Color? background,
  // Color? selectionColor = Colors.indigo,
  // Decoration? decoration,
  // int? maxLines,
  // int? minLines,
  // double? fontsize = 12,
  // String? fontFamily = 'RobotoSlab',
  // Color? color,
  // FontStyle? fontStyle = FontStyle.normal,
  // double? textHeight,
  // double? textScaleFactor,
  // double? letterSpacing,
  // double? wordSpacing,
  // TextAlign? textAlign,
  // FontWeight? fontWeight = FontWeight.normal,
}) {
  // TextStyle textStyle = TextStyle(fontFamily: fontfamily, fontSize: fontSize, fontWeight: fontWeight);
  return Container(
      height: height,
      width: width,
      margin: margin,
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: (borderRadius == null) ? borderRadiusGeometry : BorderRadius.circular(borderRadius)),
      child: ElevatedButton(
          clipBehavior: Clip.none,
          onPressed: (action == null || !isLoadingComplete) ? null : () => action(),
          style: ElevatedButton.styleFrom(
            animationDuration: const Duration(milliseconds: 200),
            surfaceTintColor: Colors.red,
            shape: shape,
            padding: buttonPadding,
            minimumSize: Size(width ?? double.infinity, height ?? 26),
            shadowColor: shadowColor,
            elevation: elevation,
            foregroundColor: foreground,
            backgroundColor: background,
            disabledForegroundColor: disabledForeground,
            disabledBackgroundColor: disabledBackground,
            alignment: Alignment.center,
            splashFactory: splashFactory,
            visualDensity: VisualDensity.comfortable,
            side: BorderSide(width: borderWidth, color: borderColor),
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius)))
          ),
          child: !isLoadingComplete
              ? myCircularLoader(height: 20)
              : (icon != null && label != null)
                  ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, size: iconSize, color: iconColor), const SizedBox(width: 6), label])
                  : (icon != null && label == null)
                      ? Icon(icon, size: iconSize, color: iconColor)
                      : label));
}

class MyButton extends StatelessWidget {
  String? label;
  void Function()? action;
  bool isLoadingComplete;
  IconData? icon;
  Color? iconColor;
  Color? foreground;
  Color? background;
  Color? disabledForeground;
  Color? disabledBackground;
  Color borderColor;
  Color? shadowColor;
  double? iconSize;
  double? height;
  double? width;
  double? elevation;
  double borderWidth;
  EdgeInsets? margin;
  EdgeInsets? buttonPadding;
  InteractiveInkFeatureFactory? splashFactory;
  TextStyle? textStyle;
  OutlinedBorder? shape;

  MyButton({
    Key? key,
    // InkSparkle.constantTurbulenceSeedSplashFactory
    this.label,
    this.action,
    this.isLoadingComplete = true,
    this.icon,
    this.iconColor,
    this.foreground = Colors.white,
    this.background = Colors.blueGrey,
    this.disabledForeground = Colors.white38,
    this.disabledBackground = Colors.black38,
    this.borderColor = Colors.transparent,
    this.shadowColor = Colors.transparent,
    this.iconSize = 18,
    this.height = 30,
    this.width = double.infinity,
    this.elevation,
    this.borderWidth = 1,
    this.margin = const EdgeInsets.fromLTRB(15, 0, 15, 15),
    this.buttonPadding,
    this.textStyle = const TextStyle(fontFamily: 'Rubik', fontWeight: FontWeight.w500, color: Colors.white),
    this.splashFactory,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        margin: margin,
        alignment: Alignment.center,
        child: ElevatedButton(
            clipBehavior: Clip.none,
            onPressed: (action == null || !isLoadingComplete) ? null : () => action!(),
            style: ElevatedButton.styleFrom(
                shape: shape,
                padding: buttonPadding,
                animationDuration: const Duration(milliseconds: 300),
                surfaceTintColor: Colors.red,
                minimumSize: Size(width ?? double.infinity, height ?? 26),
                shadowColor: shadowColor,
                elevation: elevation,
                foregroundColor: foreground,
                backgroundColor: background,
                disabledForegroundColor: disabledForeground,
                disabledBackgroundColor: disabledBackground,
                alignment: Alignment.center,
                splashFactory: splashFactory,
                textStyle: textStyle,
                visualDensity: VisualDensity.comfortable,
                side: BorderSide(width: borderWidth, color: borderColor, style: BorderStyle.solid)),
            child: !isLoadingComplete
                ? myCircularLoader(height: (height! * 0.50))
                : (icon != null && label != null)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Icon(icon, size: iconSize, color: iconColor), const SizedBox(width: 4), Text(label ?? '')])
                    : (icon != null && label == null)
                        ? Icon(icon, size: iconSize, color: iconColor)
                        : Text(label ?? '')));
  }
}

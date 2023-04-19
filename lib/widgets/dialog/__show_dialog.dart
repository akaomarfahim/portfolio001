import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/__colors.dart';
import '../widget_default/__button.dart';
import '../widget_default/__text.dart';
import '../widget_default/__textfield.dart';

Future<bool?> showAppExitDialog(BuildContext context) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
            backgroundColor: Colors.amber.shade200,
            title: Row(children: [
              const Icon(Icons.exit_to_app_sharp, size: 16, color: Colors.red),
              const SizedBox(width: 5),
              myText('Are you sure?', fontsize: 16, fontWeight: FontWeight.w500)
            ]),
            content: myText('want to exit from the application?',
                height: 20, alignment: Alignment.centerLeft, fontsize: 14, textHeight: 1.3, fontWeight: FontWeight.w400, fontFamily: 'Ubuntu'),
            actions: [
              TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('No')),
              TextButton(onPressed: () => SystemNavigator.pop(), child: const Text('Yes')),
            ]));

// Future<bool?> showAppExitDialog(BuildContext context) async => await myAlertDialog(context,
//     title: 'Are you sure?', data: 'you have filled somedata in the form, are sure about exitiing without requesting for blood?', barrierDismissible: true);

myAlertDialog(
  BuildContext context, {
  // Text Field:
  bool showTextBoxDialog = false,
  bool keyValueCheckFirebase = false,
  String initValueTextField = '',
  int minLines = 4,
  int maxLine = 10,
  bool enable = true,
  bool required = false,
  bool numbersOnly = false,
  String? denyCharsString = '',
  String? customErrorText,
  String? Function(String?)? customValidate,
  //---- Buttons ------
  String cancelButtonText = 'cancel',
  String confirmButtonText = 'confirm',
  bool hideConfirmButton = false,
  bool hideCancelButton = false,

  // ------------
  bool barrierDismissible = true,
  Color? barrierColor = Colors.black38,
  Color? dialogBackgroundColor,
  String? barrierLabel,
  String title = 'Are you sure?',
  String? data = '',
  // -
  double? elevation = 10,
  EdgeInsets margin = const EdgeInsets.all(24),
  double padding = 24,
  double borderRadius = 4,
  // Icon
  IconData? icon,
  double? iconSize = 18,
  Color? iconColor,
}) async {
  final controller = TextEditingController();
  controller.text = initValueTextField;
  bool confirm = false;
  await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: false,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Row(children: [
              if (icon != null) ...[Icon(icon, size: iconSize, color: iconColor), const SizedBox(width: 5)],
              myText(title, fontsize: 16, fontWeight: FontWeight.w500)
            ]),
            content: SingleChildScrollView(
                child: Column(children: [
              if (data != null) myText(data, maxLines: 100, fontsize: 14, textHeight: 1.3, fontWeight: FontWeight.w400, fontFamily: 'Ubuntu'),
              if (showTextBoxDialog) ...[
                myTextField(
                    controller: controller,
                    margin: const EdgeInsets.only(top: 10),
                    minLines: minLines,
                    maxLine: maxLine,
                    fontSize: 14,
                    keyValueCheckFirebase: keyValueCheckFirebase,
                    customBorder: BorderRadius.circular(2),
                    backgroundColor: Colors.grey.shade100,
                    borderRadius: 2,
                    numbersOnly: numbersOnly,
                    denyCharsString: denyCharsString,
                    customErrorText: customErrorText,
                    customValidate: customValidate,
                    showCrossIcon: true,
                    enable: enable,
                    required: required,
                    inputBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2), borderSide: const BorderSide(style: BorderStyle.solid, color: Colors.black, width: 2))),
              ]
            ])),
            clipBehavior: Clip.hardEdge,
            backgroundColor: dialogBackgroundColor,
            alignment: Alignment.center,
            elevation: elevation,
            insetPadding: margin,
            titlePadding: EdgeInsets.fromLTRB(padding, padding, padding, 0),
            contentPadding: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
            buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            // surfaceTintColor: Colors.yellow,
            // actionsPadding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
            actions: [
              Row(children: [
                if (!hideCancelButton)
                  dialogButton(cancelButtonText, CupertinoIcons.clear,
                      borderRadius: borderRadius, background: MyColors.negative, action: () => {confirm = false, Navigator.pop(context)}),
                if (!hideCancelButton && !hideConfirmButton) const SizedBox(width: 10),
                if (!hideConfirmButton)
                  dialogButton(confirmButtonText, Icons.done, borderRadius: borderRadius, background: MyColors.positive, action: () => {confirm = true, Navigator.pop(context)})
              ])
            ]);
      });

  if (showTextBoxDialog) return controller.text;
  if (!showTextBoxDialog) return confirm;
}

dialogButton(String label, IconData icon, {void Function()? action, required double borderRadius, Color background = Colors.transparent}) => Expanded(
    child: myButton(
        label: myText(label, fontsize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5, textScaleFactor: 1),
        height: 30,
        elevation: 0,
        icon: icon,
        iconSize: 14,
        shadowColor: Colors.transparent,
        borderRadius: borderRadius,
        isLoadingComplete: true,
        background: background,
        splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
        action: action));

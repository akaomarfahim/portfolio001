import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '__text.dart';

myTextField(
        {required TextEditingController controller,
        int maxLine = 1,
        int minLines = 1,
        int? lengthLimiting,
        bool enable = true,
        bool required = false,
        bool numbersOnly = false,
        bool obsecureText = false,
        bool showCrossIcon = false,
        bool showExternalLabel = false,
        bool keyValueCheckFirebase = false,
        Color? backgroundColor = Colors.white70,
        Color? labelColor,
        Color? prefixIconColor,
        String? hint,
        String? label,
        String? denyCharsString = '',
        String? customErrorText,
        double borderRadius = 6,
        BorderRadiusGeometry? customBorder,
        double heightFromRadius = 20,
        Widget? suffixIcon,
        IconData? prefixIcon,
        String? Function(String?)? customValidate,
        void Function(String)? onChanged,
        EdgeInsets? padding,
        EdgeInsets? margin = const EdgeInsets.only(bottom: 6),
        TextInputType? textInputType,
        List<TextInputFormatter>? textInputFormats,
        TextInputAction? textInputAction,
        InputBorder? inputBorder = InputBorder.none,
        TextAlign textAlign = TextAlign.start,
        // Text
        Color? textColor = Colors.black,
        String? fontFamily = 'RobotoSlab',
        double? fontSize = 12,
        FontWeight? fontWeight = FontWeight.normal,
        // Hint
        Color? textColorHint,
        String? fontFamilyHint,
        double? fontSizeHint,
        FontWeight? fontWeightHint,
        // floating label
        Color? textColorFloatingLabel,
        String? fontFamilyFloatingLabel,
        double? fontSizeFloatingLabel,
        FontWeight? fontWeightFloatingLabel,
        // label
        String? externalLabelText,
        String labelFontfamily = 'RobotoSlab',
        double labelFontSize = 12,
        EdgeInsets labelPadding = const EdgeInsets.fromLTRB(4, 0, 0, 4)}) =>
    Container(
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showExternalLabel)
              myText((externalLabelText != null) ? externalLabelText : hint ?? '',
                  alignment: Alignment.centerLeft, fontWeight: FontWeight.w500, fontFamily: labelFontfamily, fontsize: labelFontSize, padding: labelPadding),
            ClipRRect(
              borderRadius: (customBorder == null) ? BorderRadius.circular(borderRadius) : customBorder,
              child: TextFormField(
                  controller: controller,
                  keyboardType: (textInputType == null && numbersOnly) ? TextInputType.number : textInputType,
                  minLines: minLines,
                  maxLines: maxLine,
                  enableIMEPersonalizedLearning: true,
                  enableInteractiveSelection: true,
                  enableSuggestions: true,
                  enabled: enable,
                  readOnly: !enable,
                  onChanged: onChanged,
                  textAlign: textAlign,
                  obscureText: obsecureText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: textInputAction,
                  style: TextStyle(fontFamily: fontFamily, fontSize: fontSize, fontWeight: fontWeight, color: textColor),
                  validator: (customValidate == null)
                      ? (value) => (required && (value == null || value.isEmpty))
                          ? 'field must be filled'
                          : (value!.contains(RegExp(keyValueCheckFirebase ? '[\\. | \\[ | \\] | \\# | \$ ]' : denyCharsString ?? '')) && keyValueCheckFirebase)
                              ? 'value must not containes $denyCharsString'
                              : (customErrorText != null)
                                  ? customErrorText
                                  : null
                      : customValidate,
                  // validator: (value) => (value == null || value.isEmpty) ? 'field required' : null,
                  inputFormatters: numbersOnly
                      ? [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(lengthLimiting)]
                      : (textInputFormats == null)
                          ? [
                              LengthLimitingTextInputFormatter(lengthLimiting),
                              FilteringTextInputFormatter.deny(RegExp(keyValueCheckFirebase ? '[\\. | \\[ | \\] | \\# | \$ ]' : denyCharsString ?? ''))
                            ]
                          : textInputFormats,
                  cursorRadius: const Radius.circular(10),
                  decoration: InputDecoration(
                      // if level is given;. OnClick => label and text doesn't align with the icon verticaly peroperly.
                      hintText: hint,
                      hintStyle: TextStyle(fontFamily: fontFamilyHint, fontSize: fontSizeHint, fontWeight: fontWeightHint, color: textColorHint),
                      labelText: label,
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(color: labelColor),
                      // floatingLabelBehavior: FloatingLabelBehavior.never,
                      floatingLabelStyle:
                          TextStyle(color: textColorFloatingLabel, fontFamily: fontFamilyFloatingLabel, fontSize: fontSizeFloatingLabel, fontWeight: fontWeightFloatingLabel),
                      isDense: true,
                      enabled: true,
                      hintMaxLines: 1,
                      errorMaxLines: 1,
                      // errorStyle: TextStyle(fontFamily: 'Ubunutu'
                      //     // decoration: TextDecoration.lineThrough,
                      //     // decorationStyle: TextDecorationStyle.wavy,
                      //     // backgroundColor: Colors.transparent,
                      //     ),

                      errorStyle: const TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 11,
                      ),
                      errorBorder: InputBorder.none,
                      isCollapsed: true,
                      border: inputBorder,
                      fillColor: backgroundColor,
                      prefixIcon: Icon(prefixIcon),
                      prefixIconColor: prefixIconColor,
                      filled: (backgroundColor != null) ? true : false,
                      contentPadding: (padding == null) ? EdgeInsets.symmetric(vertical: (heightFromRadius / 2)) : padding,
                      // alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      suffixIconConstraints: BoxConstraints.tight(Size.fromRadius(heightFromRadius)),
                      prefixIconConstraints: (prefixIcon != null) ? const BoxConstraints.tightFor(width: 35) : const BoxConstraints.tightFor(width: 10),
                      suffixIcon: (suffixIcon == null && showCrossIcon && enable)
                          ? IconButton(onPressed: () => {controller.clear(), HapticFeedback.mediumImpact()}, icon: Icon(Icons.clear_rounded, size: 16, color: Colors.red.shade800))
                          : suffixIcon)),
            ),
          ],
        ));

Widget phoneField({required TextEditingController phoneController, String? label, bool required = false}) {
  final phoneCountryCode = TextEditingController();
  phoneCountryCode.text = '+88';
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      myText(label ?? '', fontFamily: 'RobotoSlab', alignment: Alignment.centerLeft, fontWeight: FontWeight.w500, fontsize: 12, padding: const EdgeInsets.symmetric(horizontal: 4)),
      const SizedBox(height: 4),
      Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            flex: 15,
            child: myTextField(
                controller: phoneCountryCode,
                customBorder: const BorderRadius.horizontal(left: Radius.circular(6)),
                showCrossIcon: false,
                heightFromRadius: 26,
                textAlign: TextAlign.center,
                hint: '+88',
                required: false,
                enable: false,
                backgroundColor: Colors.grey.shade100)),
        const SizedBox(width: 2),
        Expanded(
            flex: 85,
            child: myTextField(
                controller: phoneController,
                heightFromRadius: 26,
                customBorder: const BorderRadius.horizontal(right: Radius.circular(6)),
                backgroundColor: Colors.grey.shade100,
                hint: 'phone',
                lengthLimiting: 11,
                numbersOnly: true,
                required: required,
                customValidate: required
                    ? (value) => (value == null || value.isEmpty)
                        ? 'phone number is required'
                        : (value.length == 11)
                            ? null
                            : 'please enter a valid phone number'
                    : null))
      ])
    ],
  );
}

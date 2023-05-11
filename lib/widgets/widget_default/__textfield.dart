// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';

class ROOTMyTextField {
  static Color background = Colors.white;
  static EdgeInsets margin = const EdgeInsets.fromLTRB(10, 0, 10, 6);
  static EdgeInsets? externalLabelPadding = EdgeInsets.zero;

  // TextStyle
  static TextStyle externalLabelTextStyle = const TextStyle(fontFamily: 'Ubuntu', fontWeight: FontWeight.w500, color: Colors.blue, fontStyle: FontStyle.normal);
  static TextStyle textStyle = const TextStyle(fontStyle: FontStyle.normal);
  static TextStyle labelStyle = const TextStyle(fontStyle: FontStyle.normal);
  static TextStyle hintStyle = const TextStyle(fontStyle: FontStyle.normal);
  static TextStyle errorStyle = const TextStyle(fontStyle: FontStyle.normal);
  static TextStyle helperStyle = const TextStyle(fontStyle: FontStyle.normal);
  static TextStyle prefixStyle = const TextStyle(fontStyle: FontStyle.normal);
  static TextStyle suffixStyle = const TextStyle(fontStyle: FontStyle.normal);
  static Color focusColor = Colors.amber.shade100;
  static Color hoverColor = Colors.amber.shade100;
  static const clearIconButton = Icon(Icons.clear_rounded, color: Color.fromRGBO(229, 57, 53, 1));
  static const InputBorder inputBorder = OutlineInputBorder(borderSide: BorderSide.none);
  static const InputBorder errorBorder = OutlineInputBorder(borderSide: BorderSide.none);
  static const InputBorder focusedBorder = OutlineInputBorder(borderSide: BorderSide.none);
  static InputBorder enabledBorder = const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(8)));
  static const InputBorder disabledBorder = OutlineInputBorder(borderSide: BorderSide.none);
  static const InputBorder focusedErrorBorder = OutlineInputBorder(borderSide: BorderSide.none);
}

class MyTextField extends StatefulWidget {
  /// InputBorder.none creates problem with the alignment between text nad icons of the textfield. try to avoid using InputBorder.none
  ///  OutlineInputBorder(borderSide: BorderSide.none)
  ///
  // Controller
  final TextEditingController controller;
  // Container
  EdgeInsets? margin;
  final String? externalLabel;
  EdgeInsets? externalLabelPadding;
  TextStyle? externalLabelTextStyle;

  // TextFormField
  final bool enable;
  final TextInputType? keyboardType;
  int? maxlines;
  final int? minlines;
  final int? maxLength;
  bool obsecureText;
  final bool isPasswordCompatible;
  final String obscuringCharacter;
  final TextCapitalization textCapitalization;
  final TextAlignVertical? textAlignVertical;
  final AutovalidateMode? autovalidateMode;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  final TextAlign textAlign;

  // Validator and Formatter:
  final bool required;
  final bool numbersOnly;
  final int? lengthLimiting;
  final String? denyCharsString;
  final bool keyValueCheckFirebase;
  final List<TextInputFormatter>? textInputFormats;

  // On Action Functions:
  final ScrollController? scrollController;
  final void Function()? onEditingComplete;
  final void Function(PointerDownEvent)? onTapOutside;
  final String? Function(String?)? customValidate;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;

  // Colors:
  final bool? showCursor;
  final Radius? cursorRadius;
  final Color? cursorColor;
  Color? backgroundColor;
  Color? focusColor;
  Color? hoverColor;

  // Input Decoration:

  // Text Style ----------------
  TextStyle? textStyle;
  String? label;
  TextStyle? labelStyle;
  String? hint;
  TextStyle? hintStyle;
  String? error;
  TextStyle? errorStyle;
  String? helper;
  TextStyle? helperStyle;
  String? prefixText;
  TextStyle? prefixStyle;
  String? suffixText;
  TextStyle? suffixStyle;

  // Border -----------------
  // final bool showBorder;
  InputBorder? inputBorder;
  InputBorder? errorBorder;
  InputBorder? focusedBorder;
  InputBorder? enabledBorder;
  InputBorder? disabledBorder;
  InputBorder? focusedErrorBorder;
  EdgeInsets? contentPadding;

  // Icon and Label
  final Widget? icon; // oiutside the border indivisual Icon
  final Widget? prefixIcon; // inside the border
  final Widget? suffixIcon; // inside the border
  final Widget? prefix;
  final Widget? sufix;
  final bool showClearIcon;
  final Widget clearIcon;
  final BoxConstraints? constraints;

  MyTextField({
    super.key,
    required this.controller,
    this.margin,
    this.externalLabel,
    this.externalLabelPadding,
    this.externalLabelTextStyle,
    this.enable = true,
    this.keyboardType,
    this.maxlines,
    this.minlines,
    this.maxLength,
    this.obsecureText = false,
    this.isPasswordCompatible = false,
    this.obscuringCharacter = '*',
    this.textCapitalization = TextCapitalization.none,
    this.textAlignVertical,
    this.autovalidateMode,
    this.textInputAction,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.required = true,
    this.numbersOnly = false,
    this.lengthLimiting,
    this.denyCharsString,
    this.keyValueCheckFirebase = false,
    this.textInputFormats,
    this.scrollController,
    this.onEditingComplete,
    this.onTapOutside,
    this.customValidate,
    this.onFieldSubmitted,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.showCursor,
    this.cursorRadius,
    this.cursorColor,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.prefixText,
    this.prefixStyle,
    this.suffixText,
    this.suffixStyle,
    this.hint,
    this.hintStyle,
    this.label,
    this.labelStyle,
    this.error,
    this.errorStyle,
    this.helper,
    this.helperStyle,
    // Border ---
    // this.showBorder = false,
    this.inputBorder = ROOTMyTextField.inputBorder,
    this.errorBorder = ROOTMyTextField.errorBorder,
    this.focusedBorder = ROOTMyTextField.focusedBorder,
    this.enabledBorder,
    this.disabledBorder = ROOTMyTextField.disabledBorder,
    this.focusedErrorBorder = ROOTMyTextField.focusedErrorBorder,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.sufix,
    this.showClearIcon = false,
    this.clearIcon = ROOTMyTextField.clearIconButton,
    this.contentPadding,
    this.constraints,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();

    widget.margin ??= ROOTMyTextField.margin;
    widget.backgroundColor ??= ROOTMyTextField.background;
    widget.externalLabelTextStyle ??= ROOTMyTextField.externalLabelTextStyle;
    widget.enabledBorder ??= ROOTMyTextField.enabledBorder;
    widget.textStyle ??= ROOTMyTextField.textStyle;
    widget.labelStyle ??= ROOTMyTextField.labelStyle;
    widget.hintStyle ??= ROOTMyTextField.hintStyle;
    widget.errorStyle ??= ROOTMyTextField.errorStyle;
    widget.helperStyle ??= ROOTMyTextField.helperStyle;
    widget.prefixStyle ??= ROOTMyTextField.prefixStyle;
    widget.suffixStyle ??= ROOTMyTextField.suffixStyle;
    widget.focusColor ??= ROOTMyTextField.focusColor;
    widget.hoverColor ??= ROOTMyTextField.hoverColor;
    widget.externalLabelPadding ??= ROOTMyTextField.externalLabelPadding;

    if (widget.obsecureText || widget.isPasswordCompatible) widget.maxlines = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.externalLabel != null)
            MyText(widget.externalLabel, textStyleEnforcement: true, textStyle: widget.externalLabelTextStyle, padding: widget.externalLabelPadding),
          TextFormField(
            enabled: widget.enable,
            readOnly: !widget.enable,
            controller: widget.controller,
            enableIMEPersonalizedLearning: true,
            enableInteractiveSelection: true,
            enableSuggestions: true,
            keyboardType: (widget.keyboardType == null && widget.numbersOnly) ? TextInputType.number : widget.keyboardType,
            minLines: widget.minlines,
            maxLines: widget.maxlines,
            maxLength: widget.maxLength,
            obscureText: widget.isPasswordCompatible ? !_passwordVisible : widget.obsecureText,
            obscuringCharacter: widget.obscuringCharacter,
            textCapitalization: widget.textCapitalization,
            textAlignVertical: widget.textAlignVertical,
            autovalidateMode: widget.autovalidateMode,
            textInputAction: widget.textInputAction,
            textDirection: widget.textDirection,
            textAlign: widget.textAlign,
            style: widget.textStyle,
            showCursor: widget.showCursor,
            cursorRadius: widget.cursorRadius,
            cursorColor: (widget.cursorColor == null) ? widget.cursorColor : Theme.of(context).primaryColor,
            validator: (widget.customValidate == null)
                ? (value) => (widget.required && (value == null || value.isEmpty))
                    ? 'field must be filled'
                    : (value!.contains(RegExp(widget.keyValueCheckFirebase ? '[\\. | \\[ | \\] | \\# | \$ ]' : widget.denyCharsString ?? '')) && widget.keyValueCheckFirebase)
                        ? 'value must not containes ${widget.denyCharsString}'
                        : (widget.error != null)
                            ? widget.error
                            : null
                : widget.customValidate,
            inputFormatters: widget.numbersOnly
                ? [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(widget.lengthLimiting)]
                : (widget.textInputFormats == null)
                    ? [
                        LengthLimitingTextInputFormatter(widget.lengthLimiting),
                        FilteringTextInputFormatter.deny(RegExp(widget.keyValueCheckFirebase ? '[\\. | \\[ | \\] | \\# | \$ ]' : widget.denyCharsString ?? ''))
                      ]
                    : widget.textInputFormats,
            // On Action Functions :
            scrollController: widget.scrollController,
            onEditingComplete: widget.onEditingComplete,
            onFieldSubmitted: widget.onFieldSubmitted,
            onTapOutside: widget.onTapOutside,
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
            onTap: widget.onTap,
            decoration: InputDecoration(
              enabled: widget.enable,
              // constraints: BoxConstraints.tight(const Size(double.infinity, 30)),
              // if level is given;. OnClick => label and text doesn't align with the icon verticaly peroperly.
              // contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              // Text ----------------
              hintTextDirection: TextDirection.ltr,
              hintText: widget.hint,
              hintMaxLines: 1,
              hintStyle: widget.hintStyle,
              labelText: widget.label,
              labelStyle: widget.labelStyle,
              errorText: widget.error,
              errorMaxLines: 1,
              errorStyle: widget.errorStyle,
              helperText: widget.helper,
              helperStyle: widget.helperStyle,
              // Border ----------------
              // border: widget.showBorder ? widget.inputBorder : const OutlineInputBorder(borderSide: BorderSide.none),
              border: widget.inputBorder,
              errorBorder: widget.errorBorder,
              enabledBorder: widget.enabledBorder,
              disabledBorder: widget.disabledBorder,
              focusedBorder: widget.focusedBorder,
              focusedErrorBorder: widget.focusedErrorBorder,
              // Icon -------------------
              icon: widget.icon,
              // alignLabelWithHint: true,
              prefix: widget.prefix,
              suffix: widget.suffixIcon,
              prefixText: widget.prefixText,
              prefixStyle: widget.prefixStyle,
              suffixText: widget.suffixText,
              suffixStyle: widget.suffixStyle,
              prefixIcon: widget.prefixIcon,
              suffixIcon: (widget.suffixIcon == null && widget.showClearIcon && widget.enable && !widget.isPasswordCompatible)
                  ? IconButton(onPressed: () => {widget.controller.clear(), HapticFeedback.lightImpact()}, padding: EdgeInsets.zero, icon: widget.clearIcon)
                  : (widget.suffixIcon == null && widget.enable && widget.isPasswordCompatible)
                      ? IconButton(
                          icon: Icon(_passwordVisible ? CupertinoIcons.eye : CupertinoIcons.eye_slash), onPressed: () => setState(() => _passwordVisible = !_passwordVisible))
                      : widget.suffixIcon,

              // Color --------------------
              filled: true,
              fillColor: widget.backgroundColor,
              focusColor: widget.focusColor,
              hoverColor: widget.hoverColor,
              isDense: true,
              contentPadding: widget.contentPadding,
              constraints: widget.constraints,
            ),
          )
        ],
      ),
    );
  }
}

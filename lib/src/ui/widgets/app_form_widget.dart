import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'text_widget/text_size.dart';
import 'text_widget/text_widget.dart';

class FormWidget extends StatelessWidget {
  final EdgeInsets? margin;
  final Widget? label;
  final Widget? leadingIcon;
  final Widget? endingIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onInputChanged;
  final TextStyle? inputTextStyle;
  final bool isEnabled;
  final int? inputMaxLength;
  final String? initialValue;
  final String? inputHintText;
  final TextStyle? inputHintTextStyle;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final FocusNode? inputFocusNode;
  final TextInputAction? inputAction;
  final void Function(String)? onInputSubmitted;
  final Color? inputBackgroundColor;
  final String? labelText;
  final int? inputMaxlines;
  final bool obscureText;
  final bool enableSelection;
  final AutovalidateMode? autovalidateMode;

  const FormWidget({
    Key? key,
    this.margin,
    this.label,
    this.leadingIcon,
    this.endingIcon,
    this.keyboardType,
    this.controller,
    this.validator,
    this.onInputChanged,
    this.inputTextStyle,
    this.isEnabled = true,
    this.inputMaxLength,
    this.initialValue,
    this.inputHintText,
    this.inputHintTextStyle,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.inputFocusNode,
    this.inputAction,
    this.onInputSubmitted,
    this.inputBackgroundColor,
    this.labelText,
    this.inputMaxlines = 1,
    this.autovalidateMode,
    this.obscureText = false,
    this.enableSelection = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText != null
              ? Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: TextWidget(
                    labelText ?? '',
                    color: Colors.grey,
                    textSize: TextSize.large,
                  ),
                )
              : label ?? const SizedBox.shrink(),
          Container(
            color: inputBackgroundColor ?? Colors.white,
            child: TextFormField(
              enableInteractiveSelection: enableSelection,
              autovalidateMode:
                  autovalidateMode ?? AutovalidateMode.onUserInteraction,
              initialValue: initialValue,
              enabled: isEnabled,
              maxLength: inputMaxLength,
              maxLines: inputMaxlines,
              maxLengthEnforcement: inputMaxLength != null
                  ? MaxLengthEnforcement.truncateAfterCompositionEnds
                  : MaxLengthEnforcement.none,
              buildCounter: inputMaxLength == null
                  ? null
                  : (
                      BuildContext context, {
                      required int currentLength,
                      required int? maxLength,
                      required bool isFocused,
                    }) =>
                      TextWidget(
                        (maxLength! - currentLength) >= 0
                            ? (maxLength - currentLength).toString()
                            : "0",
                        color: Colors.grey,
                      ),
              keyboardType: keyboardType,
              controller: controller,
              focusNode: inputFocusNode,
              textInputAction: inputAction,
              onFieldSubmitted: onInputSubmitted,
              onChanged: onInputChanged,
              obscureText: obscureText,
              validator: validator,
              style: inputTextStyle ??
                  const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
              decoration: InputDecoration(
                hintText: inputHintText,
                hintStyle: inputHintTextStyle ??
                    const TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                border: InputBorder.none, //todo check where it effects
                focusedBorder: focusedBorder ??
                    OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1.2),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                enabledBorder: enabledBorder ??
                    OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                errorBorder: errorBorder ??
                    OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red, width: 1.5),
                        borderRadius: BorderRadius.circular(8.0)),
                focusedErrorBorder: focusedErrorBorder ??
                    OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red, width: 0.5),
                        borderRadius: BorderRadius.circular(8.0)),
                disabledBorder: disabledBorder ?? InputBorder.none,
                prefixIcon: leadingIcon,
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 0, minHeight: 0),
                suffixIcon: endingIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

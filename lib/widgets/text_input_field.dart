import 'package:flutter/material.dart';

import '../barrel/resources.dart';
import '../barrel/themes.dart';

class TextInputField extends StatelessWidget {

  final int? maxLength;
  final int? minLines, maxLines;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? hint;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool? enable;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextAlign? textAlign;
  final double? fontSize;
  final bool borderColor;

  const TextInputField({Key? key, this.maxLength, this.minLines, this.maxLines, this.obscureText = false, this.controller, this.keyboardType = TextInputType.text,
    this.hint, this.prefixIcon, this.suffixIcon, this.validator, this.enable = true, this.onChanged, this.floatingLabelBehavior = FloatingLabelBehavior.never,
    this.label, this.textAlign = TextAlign.left, this.fontSize, this.borderColor = false,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      maxLength: maxLength,
      minLines: minLines,
      maxLines: obscureText ? 1 : maxLines,
      controller: controller,
      style: TextStyles.textFieldStyle.copyWith(
        fontSize: fontSize ?? 17,
      ),
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      autofocus: false,
      enabled: enable,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      textAlign: textAlign!,
      decoration: InputDecoration(
        counterStyle: const TextStyle(color: Colors.black),
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: Colors.white,
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: TextStyles.textFieldHintStyle,
        labelText: label,
        labelStyle: TextStyles.textFieldHintStyle.copyWith(
          fontSize: 18,
          color: AppThemeNotifier.isDarkModeOn ? Colors.grey[300] : Colors.black.withOpacity(.75),
        ),
        errorStyle: TextStyles.textFieldErrorStyle,
        floatingLabelBehavior: floatingLabelBehavior,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF263238).withOpacity(.12), width: borderColor ? 1 : 0),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor.withOpacity(.3), width: borderColor ? 1 : 0),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF263238).withOpacity(.12), width: borderColor ? 1 : 0),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

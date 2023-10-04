import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VacoTextField extends StatelessWidget {
  const VacoTextField({
    super.key,
    required this.controller,
    this.prefixIconName,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
    this.autofocus = false,
    this.readOnly = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.maxLines = 1,
    this.minLines = 1,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.inputFormatters,
    this.hintText,
    this.hintColor,
    this.enabled = true,
    this.borderRadius,
  });

  final TextEditingController controller;
  final String? prefixIconName;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool autofocus;
  final bool readOnly;
  final bool obscureText;
  final bool autocorrect;
  final int? maxLines;
  final int? minLines;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final Color? hintColor;
  final double? borderRadius;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final FocusNode unUsedFocusNode = FocusNode();
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      autofocus: autofocus,
      readOnly: readOnly,
      obscureText: obscureText,
      autocorrect: autocorrect,
      maxLines: maxLines,
      minLines: minLines,
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      inputFormatters: inputFormatters,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        filled: enabled == true ? false : true,
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        prefixIcon: prefixIconName != null
            ? Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Image.asset(prefixIconName!),
              )
            : null,
        suffixIcon: suffixIcon,
        enabled: enabled,
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
      ),
      onTapOutside: (PointerDownEvent event) {
        FocusScope.of(context).requestFocus(unUsedFocusNode);
      },
    );
  }
}

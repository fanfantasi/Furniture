import 'package:flutter/material.dart';

class LabeledText extends StatelessWidget {
  const LabeledText({
    Key? key,
    required this.label,
    this.maxLines,
    this.focusNode,
    this.validator,
    this.prefixIcon,
    required this.controller,
    required this.keyboardType,
    this.onChange,
    this.onTap,
  }) : super(key: key);

  final String label;
  final int? maxLines;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String)? onChange;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      validator: validator,
      maxLines: maxLines ?? 1,
      onChanged: onChange,
      decoration: InputDecoration(
          alignLabelWithHint: true,
          errorStyle: const TextStyle(fontSize: 12),
          hintText: label,
          hintStyle: const TextStyle(fontSize: 13),
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.grey,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.red,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.red,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(color: Colors.grey, width: .2)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0)),
      controller: controller,
      keyboardType: keyboardType,
      onTap: onTap,
    );
  }
}

import 'package:flutter/material.dart';

class LabeledText extends StatelessWidget {
  const LabeledText({
    Key? key,
    required this.label,
    this.maxLines,
    this.focusNode,
    this.validator,
    this.prefixIcon,
    this.surfixIcon,
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
  final Widget? surfixIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String)? onChange;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextFormField(
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
            suffixIcon: surfixIcon,
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0)),
        controller: controller,
        keyboardType: keyboardType,
        onTap: onTap,
      ),
    );
  }
}

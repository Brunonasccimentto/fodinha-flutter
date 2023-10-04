import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomField extends StatelessWidget {
  final String labelText;
  final Function(String)? onChanged;
  final bool? autoFocus;
  final TextInputType? keyboardType;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?) validator;

  const CustomField({required this.labelText, this.onChanged, this.keyboardType, this.autoFocus, this.initialValue, required this.validator, this.controller , Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType ?? TextInputType.text,
      autofocus: autoFocus ?? false,
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
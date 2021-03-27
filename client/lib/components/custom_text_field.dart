import 'package:client/global/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final Widget? trailing;
  final void Function(String)? onSubmit, onChanged;

  CustomTextField({
    this.labelText,
    this.controller,
    this.onSubmit,
    this.onChanged,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: TextField(
        controller: controller,
        onSubmitted: onSubmit,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppTheme.lighGray,
              width: 1,
            ),
          ),
          suffixIcon: trailing,
          labelStyle: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

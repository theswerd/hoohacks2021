import 'package:client/global/app_theme.dart';
import 'package:flutter/material.dart';

class ThemedText extends StatelessWidget {
  final Type type;
  final String? text;
  final TextAlign textAlign;
  final Color? color;

  const ThemedText(
    this.text, {
    this.type = Type.body,
    this.textAlign = TextAlign.center,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: themedTextStyle(
        type,
      ).merge(
        TextStyle(color: color),
      ),
    );
  }
}

enum Type {
  h1,
  h2,
  body,
  subtitle,
  button,
}

TextStyle themedTextStyle(Type type) {
  switch (type) {
    case Type.h1:
      return TextStyle(
        color: AppTheme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      );
    case Type.h2:
      return TextStyle(
        color: AppTheme.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );
    case Type.body:
      return TextStyle(
        fontSize: 16,
        color: AppTheme.primaryText,
        fontWeight: FontWeight.w500,
      );
    case Type.subtitle:
      return TextStyle(
        color: AppTheme.secondaryText,
      );
    case Type.button:
      return TextStyle(
        color: AppTheme.buttonText,
        fontSize: 22,
      );
    default:
      return TextStyle();
  }
}

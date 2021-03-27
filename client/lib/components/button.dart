import 'package:client/components/themed_text.dart';
import 'package:client/global/app_theme.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Style style;
  final ButtonStyle buttonStyleOverides;
  final TextStyle textStyleOverides;
  final Color color;

  Button(
    this.text, {
    this.style = Style.Primary,
    required this.onPressed,
    this.buttonStyleOverides = const ButtonStyle(),
    this.textStyleOverides = const TextStyle(),
    this.color = AppTheme.primary,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: ThemedText(
          text,
          type: Type.button,
        ),
      ),
      onPressed: onPressed as void Function()?,
      style: buttonStyleOverides.merge(
        TextButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.all(12),
        ),
      ),
    );
  }
}

enum Style { Primary, Secondary }

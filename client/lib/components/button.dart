import 'package:client/components/themed_text.dart';
import 'package:client/global/app_theme.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Style style;
  final ButtonStyle buttonStyleOverides;
  final TextStyle textStyleOverides;
  final Color? color;

  Button(
    this.text, {
    this.style = Style.Primary,
    required this.onPressed,
    this.buttonStyleOverides = const ButtonStyle(),
    this.textStyleOverides = const TextStyle(),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: ThemedText(
        text,
        type: Type.button,
      ),
      onPressed: onPressed as void Function()?,
      style: buttonStyleOverides.merge(
        TextButton.styleFrom(
          backgroundColor: color ?? backgroundColor,
          padding: EdgeInsets.all(12),
          shape: shape,
        ),
      ),
    );
  }

  Color get backgroundColor {
    switch (style) {
      case Style.Primary:
        return Colors.black;
      case Style.Secondary:
        return AppTheme.primary;
      default:
        return AppTheme.primary;
    }
  }

  OutlinedBorder get shape {
    switch (style) {
      case Style.Primary:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            16,
          ),
        );
      case Style.Secondary:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            16,
          ),
        );
      default:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            16,
          ),
        );
    }
  }
}

enum Style { Primary, Secondary }

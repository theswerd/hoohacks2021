import 'package:client/components/button.dart';
import 'package:client/components/custom_text_field.dart';
import 'package:client/components/spaced_row.dart';
import 'package:client/components/themed_text.dart';
import 'package:client/global/app_theme.dart';
import 'package:flutter/material.dart';

class SignUpComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: ThemedText(
              'Sign Up',
              type: Type.h1,
            ),
          ),
        ),
        Column(
          children: [
            CustomTextField(
              labelText: 'Username',
            ),
            CustomTextField(
              labelText: 'Password',
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: SpacedRow(
                  Container(),
                  Button(
                    'Sign Up',
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

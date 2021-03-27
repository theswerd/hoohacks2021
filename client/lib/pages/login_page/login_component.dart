import 'package:client/components/button.dart';
import 'package:client/components/custom_text_field.dart';
import 'package:client/components/spaced_row.dart';
import 'package:client/components/themed_text.dart';
import 'package:client/global/app_theme.dart';
import 'package:flutter/material.dart';

class LoginComponent extends StatelessWidget {
  late final PageController controller;
  LoginComponent(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 150,
                height: 150,
                child: Placeholder(),
              ),
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
                  TextButton(
                    child: ThemedText(
                      'Sign Up',
                      color: AppTheme.primary,
                    ),
                    onPressed: () => controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease),
                  ),
                  Button(
                    'Sign In',
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

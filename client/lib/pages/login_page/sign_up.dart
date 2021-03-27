import 'package:client/components/button.dart';
import 'package:client/components/custom_text_field.dart';
import 'package:client/components/spaced_row.dart';
import 'package:client/components/themed_text.dart';
import 'package:flutter/material.dart';

class SignUpComponent extends StatelessWidget {
  late final String type;
  SignUpComponent(this.type);

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
            CustomTextField(
              labelText: 'Confirm Password',
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
                    onPressed: () {
                      print(type);
                      Navigator.pushNamed(context, '/home');
                    },
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

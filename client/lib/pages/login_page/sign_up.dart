import 'dart:convert';

import 'package:client/components/button.dart';
import 'package:client/components/custom_text_field.dart';
import 'package:client/components/spaced_row.dart';
import 'package:client/components/themed_text.dart';
import 'package:client/global/app_theme.dart';
import 'package:client/models/session.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpComponent extends StatefulWidget {
  late final String type;
  late final Session session;
  late final PageController controller;
  SignUpComponent(this.type, this.session, this.controller);

  @override
  _SignUpComponentState createState() => _SignUpComponentState();
}

class _SignUpComponentState extends State<SignUpComponent> {
  final TextEditingController username = new TextEditingController(),
      password = new TextEditingController(),
      password2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        IconButton(
          onPressed: () => widget.controller.previousPage(
              duration: Duration(milliseconds: 500), curve: Curves.ease),
          icon: Icon(
            Icons.chevron_left,
            color: AppTheme.primary,
          ),
        ),
        SizedBox(height: 16),
        Expanded(
          child: Center(
            child: ThemedText(
              'Sign Up as ' +
                  widget.type[0].toUpperCase() +
                  widget.type.substring(1),
              type: Type.h1,
            ),
          ),
        ),
        Column(
          children: [
            CustomTextField(
              labelText: 'Username',
              controller: username,
            ),
            CustomTextField(
              labelText: 'Password',
              controller: password,
            ),
            CustomTextField(
              labelText: 'Confirm Password',
              controller: password2,
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
                      print(widget.type);
                      if (password.text == password2.text)
                        // signup();
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

  Future<void> signup() {
    return http
        .post(
      Uri.parse('https://hoohacks-308916.wl.r.appspot.com/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username': username.text,
        'password': password.text,
        'type': widget.type,
      }),
    )
        .then((value) {
      print(value.statusCode);
      switch (value.statusCode) {
        case 200:
          widget.session.fromSetCookie(value.headers['set-cookie']!);
          return Navigator.of(context).pushNamed("/home");
        default:
          print(value.body);
          return null;
      }
    });
  }
}

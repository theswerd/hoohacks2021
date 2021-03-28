import 'dart:convert';

import 'package:client/components/button.dart';
import 'package:client/components/custom_text_field.dart';
import 'package:client/components/spaced_row.dart';
import 'package:client/components/themed_text.dart';
import 'package:client/global/app_theme.dart';
import 'package:client/models/session.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginComponent extends StatefulWidget {
  late final PageController controller;
  late final Session session;
  LoginComponent(this.controller);

  @override
  _LoginComponentState createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  late String username, password;

  @override
  void initState() {
    username = '';
    password = '';
    super.initState();
  }

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
              onChanged: (v) => username = v,
            ),
            CustomTextField(
              labelText: 'Password',
              onChanged: (v) => password = v,
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
                    onPressed: () => widget.controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease),
                  ),
                  Button(
                    'Sign In',
                    onPressed: () {
                      print('login in');
                      login(context);
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

  Future<void> login(BuildContext context) {
    return http
        .post(
      Uri.parse('https://hoohacks-308916.wl.r.appspot.com/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    )
        .then((value) {
      print(value.statusCode);
      switch (value.statusCode) {
        case 200:
          print('WE LOGGING INNNN');
          widget.session.fromSetCookie(value.headers['set-cookie']!);
          print('WE LOGGING INNNN 2');

          Navigator.of(context).pushNamed('/home');
          break;
        default:
          print(value.body);
          print(value.statusCode);
      }
    });
  }
}

import 'package:client/models/session.dart';
import 'package:client/pages/login_page/login_component.dart';
import 'package:client/pages/login_page/pick_type.dart';
import 'package:client/pages/login_page/sign_up.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Session session;
  LoginPage(this.session);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final PageController controller;
  late String type;

  @override
  void initState() {
    controller = new PageController(initialPage: 0);
    type = 'N/A';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 450,
          height: 500,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Stack(
                children: [
                  PageView(
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                    children: <Widget>[
                      LoginComponent(controller),
                      PickType(controller,
                          (String _type) => setState(() => type = _type)),
                      SignUpComponent(type, widget.session, controller),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

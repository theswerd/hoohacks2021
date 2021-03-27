import 'package:client/pages/login_page/login_component.dart';
import 'package:client/pages/login_page/pick_type.dart';
import 'package:client/pages/login_page/sign_up.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final PageController controller;
  late String type;

  set setType(int i) {
    type = i.toString();
  }

  @override
  void initState() {
    controller = new PageController(initialPage: 0);
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
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                children: <Widget>[
                  LoginComponent(controller),
                  PickType(controller),
                  SignUpComponent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:client/pages/sign_up/pick_type.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
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
              child: PickType(),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:client/components/themed_text.dart';
import 'package:flutter/material.dart';

class PickType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          child: ThemedText('hello'),
          onPressed: () {},
        ),
      ],
    );
  }
}

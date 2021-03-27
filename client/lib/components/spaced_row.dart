import 'package:flutter/material.dart';

class SpacedRow extends StatelessWidget {
  final Widget child1, child2;
  SpacedRow(this.child1, this.child2);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [child1, child2]));
  }
}

import 'package:client/components/spaced_row.dart';
import 'package:client/components/themed_text.dart';
import 'package:client/global/app_theme.dart';
import 'package:flutter/material.dart';

class PickType extends StatelessWidget {
  late final PageController controller;
  late final Function(String) setType;
  PickType(this.controller, this.setType);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        children: [
          SignUpButton(
            title: 'Sign up as Vaccinated',
            icon: Icons.sentiment_very_satisfied,
            onPressed: () {
              controller.nextPage(
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
              setType('vaccinated');
            },
          ),
          SignUpButton(
            title: 'Sign up as Volunteer',
            icon: Icons.person,
            onPressed: () {
              controller.nextPage(
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
              setType('volunteer');
            },
          ),
          SignUpButton(
            title: 'Sign up as Healthcare Worker',
            icon: Icons.medical_services,
            onPressed: () {
              controller.nextPage(
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
              setType('healthcare');
            },
          ),
          SignUpButton(
            title: 'Sign up as Company',
            icon: Icons.business,
            onPressed: () {
              controller.nextPage(
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
              setType('company');
            },
          ),
        ],
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  late final String title;
  late final IconData icon;
  late final Function() onPressed;
  SignUpButton(
      {required this.title, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextButton(
        child: SpacedRow(
          ThemedText(title),
          Icon(icon),
        ),
        onPressed: onPressed,
        style: TextButton.styleFrom(
          side: BorderSide(
            color: AppTheme.lighGray,
          ),
        ),
      ),
    );
  }
}

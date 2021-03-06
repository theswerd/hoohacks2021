import 'package:client/global/app_theme.dart';
import 'package:client/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/session.dart';
import 'pages/home_page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        cardTheme: CardTheme(
          elevation: 0,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: AppTheme.lighGray)),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
      builder: (c, w) => Provider(
        create: (c) => Session(),
        builder: (c, w) => w!,
        child: w,
      ),
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(
              Provider.of<Session>(context),
            ),
      },
    );
  }
}

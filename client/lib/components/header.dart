import 'package:client/components/themed_text.dart';
import 'package:client/global/app_theme.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String text;
  final bool showBack;
  final Color color;

  Header(
    this.text, {
    this.showBack = false,
    this.color = AppTheme.primary,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 64,
      expandedHeight: 72,
      automaticallyImplyLeading: false,
      leading: showBack
          ? IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: color,
                size: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      title: ThemedText(
        text,
        type: Type.h1,
        color: color,
      ),
      backgroundColor: Color(0x00),
    );
  }
}

class FlexibleHeader extends StatelessWidget {
  final String text;
  final bool showBack;
  final Color color;

  FlexibleHeader(
    this.text, {
    this.showBack = false,
    this.color = AppTheme.primary,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 64,
      expandedHeight: 128,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                showBack
                    ? SizedBox(
                        width: 32,
                        child: IconButton(
                          iconSize: 26,
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.chevron_left,
                            color: color,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    : Container(),
                ThemedText(
                  text,
                  type: Type.h1,
                  color: color,
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color(0x00),
    );
  }
}

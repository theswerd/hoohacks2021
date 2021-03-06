import 'dart:math';

import 'package:client/components/themed_text.dart';
import 'package:client/global/app_theme.dart';
import 'package:client/global/fake_data.dart';
import 'package:client/models/offer.dart';
import 'package:client/pages/home_page/offer_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: ThemedText(
            'Adhering to Gravity',
            type: Type.h1,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4,
              ),
              delegate: SliverChildBuilderDelegate(
                (c, i) => OfferTile(offers[i]),
                childCount: offers.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

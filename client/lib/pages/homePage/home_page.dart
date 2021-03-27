import 'dart:math';

import 'package:client/components/themed_text.dart';
import 'package:client/global/app_theme.dart';
import 'package:client/global/fake_data.dart';
import 'package:client/models/offer.dart';
import 'package:client/pages/homePage/offer_tile.dart';
import 'package:flutter/material.dart';

import '../../components/header.dart';

class HomePage extends StatelessWidget {
  final List<Offer> offers = List.generate(
      30,
      (i) => new Offer(
          name: names[Random().nextInt(names.length)],
          description: 'Come in a a free hug!',
          photoURL: 'url',
          usesLeft: Random().nextInt(20)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: CustomScrollView(
        slivers: [
          Header(),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              // childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (c, i) => OfferTile(offers[i]),
              childCount: offers.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 32),
              child: Container(
                color: AppTheme.primary,
                child: ThemedText('Hello'),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

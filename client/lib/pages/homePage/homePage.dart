import 'dart:math';

import 'package:client/models/offer.dart';
import 'package:client/pages/homePage/offerTile.dart';
import 'package:flutter/material.dart';

import '../../components/header.dart';

class HomePage extends StatelessWidget {
  final List<Offer> offers = List.generate(
      10,
      (i) => new Offer(
          name: 'Hello',
          description: 'Hello guys welcome back to another minecraft video.',
          photoURL: 'url',
          usesLeft: Random().nextInt(20)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        Header(),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (c, i) => OfferTile(offers[i]),
            childCount: offers.length,
          ),
        )
      ],
    ));
  }
}

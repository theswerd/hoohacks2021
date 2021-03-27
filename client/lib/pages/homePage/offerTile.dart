import 'package:client/components/themed_text.dart';
import 'package:client/models/offer.dart';
import 'package:flutter/material.dart';

class OfferTile extends StatelessWidget {
  final Offer offer;
  OfferTile(this.offer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ThemedText(offer.name),
    );
  }
}

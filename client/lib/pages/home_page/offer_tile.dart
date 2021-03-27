import 'package:client/components/themed_text.dart';
import 'package:client/models/offer.dart';
import 'package:flutter/material.dart';

class OfferTile extends StatelessWidget {
  final Offer offer;
  OfferTile(this.offer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: TextButton(
          onPressed: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4)),
                child: Image.asset(
                  'assets/background.png',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ThemedText(
                      offer.name,
                      type: Type.h2,
                      // textAlign: TextAlign.start,
                    ),
                    ThemedText(
                      offer.description,
                      type: Type.subtitle,
                      // textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:client/components/themed_text.dart';
import 'package:client/models/offer.dart';
import 'package:flutter/material.dart';

class OfferInfoPage extends StatelessWidget {
  late final Offer offer;
  OfferInfoPage(this.offer);

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
      body: Column(
        children: [
          Image.asset(
            offer.photoURL,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: ThemedText(
                      offer.name,
                      type: Type.h1,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                ThemedText(
                  offer.description,
                  type: Type.h2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

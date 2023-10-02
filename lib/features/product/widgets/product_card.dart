import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../models/beer.dart';

class ProductCard extends StatelessWidget {
  final Beer beer;

  const ProductCard(this.beer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12.0), 
      ),
      elevation: 4, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              image: DecorationImage(
                image: AssetImage(
                    "assets/Images/beer_bubbles.png"), 
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 120,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Image.network(
                    beer.imageUrl!,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(3)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Text(
                    "First Brewed: 09/2007",
                    style: bodyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: primaryColor),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  beer.name!,
                  style: bodyTextStyle.copyWith(
                      fontWeight: FontWeight.w500, fontSize: 14, color: kBlack),
                ),
                const SizedBox(height: 8),
                Text(
                  beer.description!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: bodyTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kLightGrey),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                  ),
                  child: Row(
                    children: [
                      beerBottomDetails(
                          topText: "ABV",
                          bottomText: beer.abv!.toInt().toString()),
                      const SizedBox(
                        width: 10,
                      ),
                      beerBottomDetails(
                          topText: "IBU",
                          bottomText: beer.ibu!.toInt().toString())
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget beerBottomDetails(
      {required String topText, required String bottomText}) {
    return Column(
      children: [
        Text(
          topText,
          style: smallbodyTextStyle,
        ),
        Text(
          bottomText,
          style: smallbodyTextStyle,
        ),
      ],
    );
  }
}

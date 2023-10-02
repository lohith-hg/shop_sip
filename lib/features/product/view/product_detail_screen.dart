import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../router.dart';
import '../models/beer.dart';
import '../widgets/custom_info_row.dart';

class ProductDetailScreen extends StatelessWidget {
  final Beer? beer;

  const ProductDetailScreen({Key? key, this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderWithImg(context),
              const SizedBox(height: 160),
              _buildDescription(),
              _buildInfoRows(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderWithImg(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.3,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 20,
            left: 12,
            child: InkWell(
              onTap: () {
                router.pop();
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: kBlack,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 10, bottom: 15),
                  child: Text(
                    beer!.name!,
                    style: largebodyTextStyle.copyWith(
                      color: const Color(0xFFAFB2B5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 15),
                  child: Text(
                    beer!.tagline!,
                    style: bodyTextStyle.copyWith(
                      color: const Color(0xFFAFB2B5),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -135,
            left: MediaQuery.of(context).size.width / 4,
            child: Container(
              height: 270,
              width: 190,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFD8D8D8),
              ),
              child: Image.network(
                beer!.imageUrl!,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: largebodyTextStyle.copyWith(
              fontWeight: FontWeight.w500,
              color: kBlack,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            beer!.description!,
            style: bodyTextStyle.copyWith(
              height: 1.5,
              fontWeight: FontWeight.w400,
              color: kLightGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 6),
            child: Text(
              "First Brewed",
              style: largebodyTextStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: kBlack,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            beer!.firstBrewed!,
            style: bodyTextStyle.copyWith(
              fontWeight: FontWeight.w400,
              color: kLightGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              "Getting to Know Your Beer Better",
              style: largebodyTextStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: kBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRows() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInfoRow(
            title1: "ABV",
            value1: beer!.abv!.toInt().toString(),
            title2: "IBU",
            value2: beer!.ibu!.toInt().toString(),
          ),
          CustomInfoRow(
            title1: "TARGET FG",
            value1: beer!.targetFg!.toInt().toString(),
            title2: "TARGET OG",
            value2: beer!.targetOg!.toInt().toString(),
          ),
          CustomInfoRow(
            title1: "EBC",
            value1: beer!.ebc!.toInt().toString(),
            title2: "SRM",
            value2: beer!.srm!.toInt().toString(),
          ),
          CustomInfoRow(
            title1: "PH",
            value1: beer!.ph!.toInt().toString(),
            title2: "ATTENTION LEVEL",
            value2: beer!.attenuationLevel!.toInt().toString(),
          ),
          CustomInfoRow(
            title1: "ABV",
            value1: "4.5",
            title2: "ATTENTION LEVEL",
            value2: "60",
          ),
        ],
      ),
    );
  }
}

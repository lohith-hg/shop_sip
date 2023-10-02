import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/styles.dart';

class CustomInfoRow extends StatelessWidget {
  final String title1;
  final String value1;
  final String title2;
  final String value2;

  CustomInfoRow({
    required this.title1,
    required this.value1,
    required this.title2,
    required this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoColumn(title1, value1),
          _buildInfoColumn(title2, value2),
          Container()
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Image.asset("assets/Images/beer_icon.png")),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  title,
                  style: bodyTextStyle.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 130,
                child: Text(
                  value,
                  style: bodyTextStyle.copyWith(
                      fontWeight: FontWeight.w400, color: kLightGrey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

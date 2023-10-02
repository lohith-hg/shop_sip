import 'package:flutter/material.dart';

import '../../../constants/styles.dart';

class UserDetailField extends StatelessWidget {
  final String fieldName;
  final String fieldValue;

  const UserDetailField({super.key, 
    required this.fieldName,
    required this.fieldValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            fieldName,
            style: bodyTextStyle.copyWith(color: const Color(0xFF979797)),
          ),
        ),
        Container(
          height: 70,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                fieldValue,
                style: bodyTextStyle,
              ),
            ),
          ),
        )
      ],
    );
  }
}

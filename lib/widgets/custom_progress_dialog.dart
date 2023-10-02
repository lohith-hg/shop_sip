import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomProgressDialog extends StatelessWidget {
  const CustomProgressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: const SizedBox(
        width: 200,
        height: 200,
        child: Center(
          child: CircularProgressIndicator(
            color: secondaryColor,
          ),
        ),
      ),
      backgroundColor: primaryColor,
    );
  }
}

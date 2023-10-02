import 'package:flutter/material.dart';
import '../constants/styles.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Function onTap;
  final double width;
  final double height;
  final String? iconPath;
  const CustomButton(
      {Key? key,
      required this.backgroundColor,
      required this.borderColor,
      required this.textColor,
      required this.name,
      required this.onTap,
      this.iconPath,
      this.width = 400,
      this.height = 70})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {},
      onTap: () => onTap(),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath != null)
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Image.asset(
                  iconPath!,
                  height: 50,
                ),
              ),
            Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    name,
                    style: bodyTextStyle.copyWith(
                        fontWeight: FontWeight.w600, color: textColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

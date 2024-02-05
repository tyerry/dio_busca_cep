import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final double widthPercentage;
  final double heightPercentage;
  final Color textColor;
  final FontWeight textWeight;
  final String text;

  const CustomSizedBox({
    super.key,
    required this.widthPercentage,
    required this.heightPercentage,
    required this.textColor,
    required this.textWeight,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * widthPercentage,
      height: MediaQuery.of(context).size.height * heightPercentage,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontWeight: textWeight),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

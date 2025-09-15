import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.textMessage,
    this.fontSize = 24,
    this.ver = 20,
  });
  final String textMessage;
  final double fontSize;
  final double ver;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: ver),
        child: Text(
          textMessage,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: CustomColor.whitePrimary,
          ),
        ),
      ),
    );
  }
}

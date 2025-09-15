import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';

class CustomeTextfield extends StatelessWidget {
  const CustomeTextfield({super.key, required this.labelText, this.controller});
  final String labelText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      decoration: InputDecoration(
        border: getBorder(),
        enabledBorder: getBorder(color: CustomColor.whiteSecondary),
        focusedBorder: getBorder(color: Colors.blueAccent),
        labelText: labelText,
        labelStyle: const TextStyle(color: CustomColor.hintDark),
      ),
    );
  }

  InputBorder getBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? CustomColor.whiteSecondary),
    );
  }
}

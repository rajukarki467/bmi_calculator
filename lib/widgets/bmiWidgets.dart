import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bmiwidgets {
  static Widget genderContainer({
    required Icon icon,
    required String gender,
    required bool isSelected,
    VoidCallback? callback,
  }) {
    return InkWell(
      onTap: () {
        callback!();
      },
      child: Container(
        height: 140,
        width: 140,

        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromARGB(255, 18, 14, 42)
              : Color.fromARGB(255, 29, 23, 61),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            customText(text: gender),
          ],
        ),
      ),
    );
  }

  static Text customText({required String text, double? fsi}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fsi ?? 22,
        color: Colors.white24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Text customText2({required double text, double? fsi}) {
    return Text(
      "${text}",
      style: TextStyle(
        fontSize: fsi ?? 22,
        color: Colors.white24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Text customText1({
    required String text,
    required double fsi,
    required Color color,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fsi,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Widget customContainer({
    required String text,
    required double value,
    required VoidCallback inccallback,
    required VoidCallback deccallback,
  }) {
    return Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 29, 23, 61),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customText(text: text, fsi: 16),
          customText2(text: value, fsi: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: CustomColor.appBar,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                  onPressed: () {
                    deccallback();
                  },
                  icon: Icon(Icons.remove, color: Colors.white),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: CustomColor.appBar,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                  onPressed: () {
                    inccallback();
                  },
                  icon: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

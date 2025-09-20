import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bmiwidgets {
  static Widget genderContainer({required Icon icon, required String gender}) {
    return Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 27, 22, 55),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          customText(text: gender),
        ],
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

  static Widget customContainer({required String text, required String value}) {
    return Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 27, 22, 55),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customText(text: text, fsi: 16),
          customText(text: value, fsi: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

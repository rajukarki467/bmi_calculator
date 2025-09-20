// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator/utils/bmi_helper.dart';
import 'package:bmi_calculator/widgets/bmiWidgets.dart';

class Bmiresultpage extends StatelessWidget {
  const Bmiresultpage({super.key, required this.result});
  final BMIResult result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          "BMI RESULT",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 25, 20, 45),
      ),
      backgroundColor: Color.fromARGB(255, 25, 20, 45),

      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                // height: 420,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 29, 23, 61),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Bmiwidgets.customText1(
                      text: result.state,
                      fsi: 18,
                      color: Colors.green,
                    ),
                    Bmiwidgets.customText1(
                      text: result.value.toStringAsPrecision(4),
                      fsi: 40,
                      color: Colors.white,
                    ),

                    Bmiwidgets.customText1(
                      text: result.message,
                      fsi: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(color: CustomColor.appBar),
                child: Center(
                  child: Text(
                    "RE-CALCULATE",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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

// import 'package:bmi_calculator/pages/home_page.dart';
// import 'package:bmi_calculator/utils/bmi_helper.dart';
import 'package:bmi_calculator/pages/bmiresultpage.dart';
import 'package:bmi_calculator/pages/home_page.dart';
import 'package:bmi_calculator/pages/homebmiscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

  // Example usage
  //  final result = calculateBMI(Gender.male, 5, 10, 180, 25);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI - Calculator',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

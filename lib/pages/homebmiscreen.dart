import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/pages/bmiresultpage.dart';
import 'package:bmi_calculator/utils/bmi_helper.dart';
import 'package:bmi_calculator/widgets/bmiWidgets.dart';
import 'package:flutter/material.dart';

class Homebmiscreen extends StatefulWidget {
  const Homebmiscreen({super.key});

  @override
  State<Homebmiscreen> createState() => _HomebmiscreenState();
}

class _HomebmiscreenState extends State<Homebmiscreen> {
  double weightvalue = 55;
  double agevalue = 20;
  bool isSelected = false;
  Gender selectGender = Gender.male;

  double heightInIches = 67;
  String get heightFormatted {
    final selectedFeet = heightInIches ~/ 12;
    final selectedInches = (heightInIches % 12).round();
    return "$selectedFeet'$selectedInches\"";
  }

  int selectedFeet = 5;
  int selectedInches = 7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(170, 42, 35, 75),
      ),
      backgroundColor: Color.fromARGB(170, 42, 35, 75),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Bmiwidgets.genderContainer(
                icon: Icon(Icons.male, size: 70),
                gender: "MALE",
                isSelected: selectGender == Gender.male,
                callback: () {
                  setState(() {
                    selectGender = Gender.male;
                  });
                },
              ),
              Bmiwidgets.genderContainer(
                icon: Icon(Icons.female, size: 70),
                gender: "FEMALE",
                isSelected: selectGender == Gender.female,
                callback: () {
                  setState(() {
                    selectGender = Gender.female;
                  });
                },
              ),
            ],
          ),
          // SizedBox(height: 20),
          Container(
            height: 180,
            width: double.infinity,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 29, 23, 61),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Bmiwidgets.customText(text: "HEIGHT"),
                Bmiwidgets.customText(text: heightFormatted, fsi: 36),
                Slider(
                  thumbColor: Colors.white,
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey.shade700,
                  value: heightInIches,
                  min: 24,
                  max: 107,
                  divisions: 83,
                  label: heightFormatted,

                  onChanged: (value) {
                    setState(() {
                      heightInIches = value;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Bmiwidgets.customContainer(
                text: "WEIGHT",
                value: weightvalue,
                inccallback: () {
                  setState(() {
                    weightvalue++;
                  });
                },
                deccallback: () {
                  setState(() {
                    weightvalue--;
                  });
                },
              ),
              Bmiwidgets.customContainer(
                text: "AGE",
                value: agevalue,
                inccallback: () {
                  setState(() {
                    agevalue++;
                  });
                },
                deccallback: () {
                  setState(() {
                    agevalue--;
                  });
                },
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Bmiresultpage(
                    result: calculateBMI(
                      gender: selectGender,
                      heightInches: heightInIches,
                      weight: weightvalue,
                      age: agevalue,
                    ),
                  ),
                ),
              );
            },
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(color: CustomColor.appBar),
              child: Center(
                child: Text(
                  "CALCULATE",
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
    );
  }
}

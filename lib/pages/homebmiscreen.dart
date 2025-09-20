import 'package:bmi_calculator/pages/bmiresultpage.dart';
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
  String? selectGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 25, 20, 45),
      ),
      backgroundColor: Color.fromARGB(255, 25, 20, 45),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Bmiwidgets.genderContainer(
                icon: Icon(Icons.male, size: 70),
                gender: "MALE",
                isSelected: selectGender == "MALE",
                callback: () {
                  setState(() {
                    selectGender = "MALE";
                  });
                },
              ),
              Bmiwidgets.genderContainer(
                icon: Icon(Icons.female, size: 70),
                gender: "FEMALE",
                isSelected: selectGender == "FEMALE",
                callback: () {
                  setState(() {
                    selectGender = "FEMALE";
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
                Bmiwidgets.customText(text: "5'7\""),
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
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Bmiresultpage()),
          );
        },
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(color: Color.fromARGB(223, 174, 4, 50)),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

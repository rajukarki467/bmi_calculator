import 'package:bmi_calculator/widgets/bmiWidgets.dart';
import 'package:flutter/material.dart';

class Homebmiscreen extends StatefulWidget {
  const Homebmiscreen({super.key});

  @override
  State<Homebmiscreen> createState() => _HomebmiscreenState();
}

class _HomebmiscreenState extends State<Homebmiscreen> {
  RangeValues _selectedRange = RangeValues(3, 7);
  final String value = "";
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
        backgroundColor: Color.fromARGB(255, 18, 14, 34),
      ),
      backgroundColor: Color.fromARGB(255, 19, 15, 37),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Bmiwidgets.genderContainer(
                icon: Icon(Icons.male, size: 70),
                gender: "MALE",
              ),
              Bmiwidgets.genderContainer(
                icon: Icon(Icons.female, size: 70),
                gender: "FEMALE",
              ),
            ],
          ),
          // SizedBox(height: 20),
          Container(
            height: 180,
            width: double.infinity,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 27, 22, 55),
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
              Bmiwidgets.customContainer(text: "WEIGHT", value: "155"),
              Bmiwidgets.customContainer(text: "AGE", value: "20"),
            ],
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(color: Color.fromARGB(248, 237, 10, 71)),
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

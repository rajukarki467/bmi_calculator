import 'package:bmi_calculator/widgets/bmiWidgets.dart';
import 'package:flutter/material.dart';

class Bmiresultpage extends StatelessWidget {
  const Bmiresultpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
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

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            Text(
              "Your Result",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 420,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 29, 23, 61),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Bmiwidgets.customText1(
                    text: "Normal",
                    fsi: 18,
                    color: Colors.green,
                  ),
                  Bmiwidgets.customText1(
                    text: "25.0",
                    fsi: 40,
                    color: Colors.white,
                  ),

                  Column(
                    children: [
                      Bmiwidgets.customText1(
                        text: "You have a normal body weight.",
                        fsi: 20,
                        color: Colors.white,
                      ),
                      Bmiwidgets.customText1(
                        text: "GOOD JOB!!",
                        fsi: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(color: Color.fromARGB(223, 174, 4, 50)),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

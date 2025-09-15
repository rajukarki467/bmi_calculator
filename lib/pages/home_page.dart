import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/widgets/custom_text.dart';
import 'package:bmi_calculator/widgets/custome_textfield.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  String bmiResult = "";
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenwidth = screenSize.width;

    return Scaffold(
      appBar: AppBar(title: CustomText(textMessage: "BMI Calculator")),
      backgroundColor: CustomColor.ScaffoldBg,
      body: Center(
        child: Container(
          width: screenwidth / 1.2,
          child: Column(
            children: [
              CustomText(textMessage: "Calculate Your BMI ", fontSize: 18),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    CustomeTextfield(
                      labelText: "Enter your weight in Kg.",
                      controller: controller1,
                    ),
                    const SizedBox(height: 15),
                    CustomeTextfield(
                      labelText: "Enter your height in cm",
                      controller: controller2,
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        String inputValue1 = controller1.text;
                        String inputValue2 = controller2.text;
                        // print(inpuvalue2);
                        // Try parsing safely
                        double? weight = double.tryParse(inputValue1);
                        double? height = double.tryParse(inputValue2);

                        if (weight != null && height != null && height > 0) {
                          height = height / 100; //converting to meter
                          double bmi = (weight) / (height * height);
                          String bmiMessage = "";

                          // Determine BMI category
                          if (bmi < 18.5) {
                            bmiMessage = "You are underweight";
                          } else if (bmi >= 18.5 && bmi < 24.9) {
                            bmiMessage = "You are normal";
                          } else if (bmi >= 25 && bmi < 29.9) {
                            bmiMessage = "You are overweight";
                          } else {
                            bmiMessage = "You are unhealthy";
                          }

                          setState(() {
                            // Combine BMI value and message
                            bmiResult =
                                "Your BMI is: ${bmi.toStringAsFixed(2)}\n$bmiMessage";

                            // Reset the input fields
                            controller1.clear();
                            controller2.clear();
                          });
                        } else {
                          setState(() {
                            bmiResult =
                                "Invalid input! Please enter valid numbers.";
                          });
                        }
                      },
                      child: CustomText(
                        textMessage: "Calculate BMI ",
                        fontSize: 14,
                        ver: 0,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColor.yellowPimary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    //result display
                    CustomText(textMessage: bmiResult, fontSize: 16, ver: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

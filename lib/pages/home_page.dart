import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/widgets/custom_text.dart';
import 'package:bmi_calculator/widgets/custome_textfield.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenwidth = screenSize.width;

    final TextEditingController controller1 = TextEditingController();
    final TextEditingController controller2 = TextEditingController();
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
                        String inpuvalue1 = controller1.text;
                        String inpuvalue2 = controller2.text;
                        // print(inpuvalue2);
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

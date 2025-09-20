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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(textMessage: "BMI Calculator"),
        backgroundColor: CustomColor.ScaffoldBg,
      ),
      backgroundColor: CustomColor.ScaffoldBg,

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.male),
                // CustomText(textMessage: "Calculate Your BMI ", fontSize: 18),
                // const SizedBox(height: 90),
                CustomeTextfield(
                  labelText: "Enter your weight in Kg.",
                  name: 'Weight',
                  controller: controller1,
                  onChange: computeBMI,
                ),
                const SizedBox(height: 15),
                CustomeTextfield(
                  labelText: "Enter your height in cm",
                  name: 'Height',
                  controller: controller2,
                  onChange: computeBMI,
                ),
                const SizedBox(height: 15),

                const SizedBox(height: 20),
                //result display
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  child: CustomText(
                    textMessage: bmiResult,
                    fontSize: 16,
                    ver: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void computeBMI() {
    final bool isFormValid = (_formKey.currentState?.validate()) ?? false;

    if (!isFormValid) {
      bmiResult = "";
      setState(() {});

      return;
    }

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
        bmiMessage = "You are underweight\n\nTry eating milk and bananas daily";
      } else if (bmi >= 18.5 && bmi < 24.9) {
        bmiMessage = "You are normal";
      } else if (bmi >= 25 && bmi < 29.9) {
        bmiMessage = "You are overweight";
      } else {
        bmiMessage = "You are unhealthy";
      }

      setState(() {
        // Combine BMI value and message
        bmiResult = "Your BMI is: ${bmi.toStringAsFixed(2)}\n$bmiMessage";

        // Reset the input fields
        // _formKey.currentState?.reset();
      });
    }
  }
}

enum Gender { male, female }

class BMIResult {
  final double value;
  final String state;
  final String message;

  BMIResult({required this.value, required this.state, required this.message});
}

BMIResult calculateBMI({
  required Gender gender,
  required double heightInches,
  required double weight, // kg
  required double age, // years, decimals allowed
}) {
  double heightInMeters = heightInches * 0.0254;
  double bmi = weight / (heightInMeters * heightInMeters);

  String state;
  String message;

  if (age < 2) {
    // Too young for BMI interpretation
    state = "AGE_TOO_LOW";
    message = "BMI is not typically used for children under 2 years old.";
    return BMIResult(value: bmi, state: state, message: message);
  }

  if (age >= 2 && age < 20) {
    // CHILD BMI interpretation using rough percentile cutoffs (approximate)
    // Note: This is a simplification for demonstration only.

    // Approximate BMI percentile cutoffs by gender (from CDC charts):
    // Underweight: < 5th percentile
    // Healthy: 5th - 85th percentile
    // Overweight: 85th - 95th percentile
    // Obese: > 95th percentile

    // Approximate BMI percentile thresholds by age & gender
    // These numbers are illustrative, based on average BMI for age/gender

    double underweightCutoff;
    double overweightCutoff;
    double obeseCutoff;

    if (gender == Gender.male) {
      if (age < 5) {
        underweightCutoff = 14.5;
        overweightCutoff = 17.5;
        obeseCutoff = 19.0;
      } else if (age < 10) {
        underweightCutoff = 14.0;
        overweightCutoff = 19.0;
        obeseCutoff = 21.5;
      } else if (age < 15) {
        underweightCutoff = 16.0;
        overweightCutoff = 23.0;
        obeseCutoff = 26.5;
      } else {
        // 15-19 years male
        underweightCutoff = 17.0;
        overweightCutoff = 25.0;
        obeseCutoff = 29.0;
      }
    } else if (gender == Gender.female) {
      if (age < 5) {
        underweightCutoff = 14.0;
        overweightCutoff = 18.5;
        obeseCutoff = 20.5;
      } else if (age < 10) {
        underweightCutoff = 13.5;
        overweightCutoff = 19.0;
        obeseCutoff = 22.0;
      } else if (age < 15) {
        underweightCutoff = 15.5;
        overweightCutoff = 23.0;
        obeseCutoff = 27.0;
      } else {
        // 15-19 years female
        underweightCutoff = 16.5;
        overweightCutoff = 25.0;
        obeseCutoff = 29.0;
      }
    } else {
      // gender == none
      // use rough averages of male and female cutoffs
      underweightCutoff = 15.0;
      overweightCutoff = 21.5;
      obeseCutoff = 25.0;
    }

    if (bmi < underweightCutoff) {
      state = "UNDERWEIGHT";
      message = "Your BMI is below the healthy range for your age and gender.";
    } else if (bmi < overweightCutoff) {
      state = "NORMAL";
      message = "Your BMI is within a healthy range for your age and gender.";
    } else if (bmi < obeseCutoff) {
      state = "OVERWEIGHT";
      message =
          "Your BMI is above the healthy range. Consider healthy lifestyle changes.";
    } else {
      state = "OBESE";
      message =
          "Your BMI is well above the healthy range. Please consult a healthcare provider.";
    }

    return BMIResult(value: bmi, state: state, message: message);
  }

  // Adult BMI interpretation (age >= 20)
  // Slightly adjust for older adults > 65
  double underweightThreshold = 18.5;
  double normalThreshold = 24.9;
  double overweightThreshold = 29.9;

  if (age > 65) {
    normalThreshold = 27.0;
    overweightThreshold = 30.0;
  }

  if (bmi < underweightThreshold) {
    state = "UNDERWEIGHT";
    message = gender == Gender.female
        ? "You're underweight. A nutritionist can help you reach a healthier balance."
        : "You might need to gain some weight for better health and energy.";
  } else if (bmi <= normalThreshold) {
    state = "NORMAL";
    message = gender == Gender.female
        ? "Your weight is in the healthy range. Keep up the good habits!"
        : "Good job! You're maintaining a healthy weight.";
  } else if (bmi <= overweightThreshold) {
    state = "OVERWEIGHT";
    message = gender == Gender.female
        ? "You might consider lifestyle adjustments to reach a healthier weight."
        : "Try to incorporate regular exercise and healthy eating into your routine.";
  } else {
    state = "OBESE";
    message = gender == Gender.female
        ? "It’s important to speak with a healthcare provider for personalized advice."
        : "Obesity may increase your risk of health issues. Please consult your doctor.";
  }

  return BMIResult(value: bmi, state: state, message: message);
}

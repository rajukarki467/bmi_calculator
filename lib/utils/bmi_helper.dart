// Define Gender enum
enum Gender { male, female }

// Define BMIResult class to hold result data
class BMIResult {
  final double value;
  final String state;
  final String message;

  BMIResult({required this.value, required this.state, required this.message});
}

// Function to calculate BMI and generate result
BMIResult calculateBMI(
  Gender gender,
  int heightFeet,
  int heightInches,
  int weight,
  int age,
) {
  // Convert height to inches
  int totalHeightInches = (heightFeet * 12) + heightInches;

  // Calculate BMI = (weight in kg) / (height in meters squared)
  double heightInMeters =
      totalHeightInches * 0.0254; // Convert inches to meters
  double heightSquared = heightInMeters * heightInMeters;
  double bmi = weight / heightSquared;

  // Determine BMI state and message based on result
  String state;
  String message;
  if (bmi < 18.5) {
    state = "UNDERWEIGHT";
    message = "You should gain some weight for a healthier body. Eat well!";
  } else if (bmi >= 18.5 && bmi < 24.9) {
    state = "NORMAL";
    message = "You've a good body weight. GOOD JOB!!!";
  } else if (bmi >= 25 && bmi < 29.9) {
    state = "OVERWEIGHT";
    message = "You might want to lose a bit of weight for better health.";
  } else {
    state = "OBESE";
    message =
        "It's recommended to consult a health expert for advice on weight loss.";
  }

  // Return the BMI result object
  return BMIResult(value: bmi, state: state, message: message);
}

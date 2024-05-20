import 'package:bmi_calculator/components/bmi_scale.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {super.key,
      required this.userBMIValue,
      required this.userGender,
      required this.userAge});

  final double userBMIValue;
  final String userGender;
  final int userAge;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // Initial BMI indicator color and message
  Color bmiColor = kBMIGreenThemeColor;
  String bmiMessage = "NORMAL";

  void getBMIColorAndText(double bmiValue) {
    if (bmiValue < 18.5) {
      bmiColor = kBMIBlueThemeColor;
      bmiMessage = "UNDER WEIGHT";
    } else if (bmiValue >= 18.5 && bmiValue <= 24.9) {
      bmiColor = kBMIGreenThemeColor;
      bmiMessage = "NORMAL";
    } else if (bmiValue >= 25 && bmiValue <= 29.9) {
      bmiColor = kBMIYellowThemeColor;
      bmiMessage = "OVER WEIGHT";
    } else if (bmiValue >= 30 && bmiValue <= 34.9) {
      bmiColor = kBMIOrangeThemeColor;
      bmiMessage = "OBESE";
    } else {
      bmiColor = kBMIRedThemeColor;
      bmiMessage = "EXTREMELY OBESE";
    }
  }

  @override
  void initState() {
    getBMIColorAndText(widget.userBMIValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Gender, Age panel
            Container(
              decoration: BoxDecoration(
                color: kInactiveCardColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    /// User gender
                    Text(
                      'Gender: ${widget.userGender}',
                      style: kLabelTextStyle,
                    ),

                    /// User age
                    Text(
                      'Age: ${widget.userAge}',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
              ),
            ),

            /// Add space
            const SizedBox(height: 16.0),

            /// BMI scale
            BMIScale(
              text1: widget.userBMIValue.toString(),
              value: widget.userBMIValue,
              min: 0.0,
              max: 60.0,
              onChanged: (double userBMI) {
                setState(() {
                  userBMI = userBMI;
                });
              },
              bmiColor: bmiColor,
              bmiMessage: bmiMessage,
            ),
          ],
        ),
      ),
    );
  }
}

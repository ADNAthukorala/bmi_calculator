import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BMIScale extends StatelessWidget {
  const BMIScale(
      {super.key,
      required this.text1,
      required this.value,
      required this.min,
      required this.max,
      required this.onChanged,
      required this.bmiColor,
      required this.bmiMessage});

  final String text1;
  final double value;
  final double min;
  final double max;
  final Color bmiColor;
  final String bmiMessage;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kInactiveCardColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Body Mass Index (BMI)",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: kIConColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: bmiColor,
                  ),
                ),
                Text(
                  "kg/m\u00B2",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: bmiColor,
                  ),
                ),
              ],
            ),
            Text(
              bmiMessage,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: bmiColor,
              ),
            ),
            SliderTheme(
              data: kBMISliderStyle.copyWith(activeTrackColor: bmiColor),
              child: Slider(
                value: value,
                min: min,
                max: max,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

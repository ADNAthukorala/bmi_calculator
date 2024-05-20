import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Initial user details
  String userGender = 'Male';
  int userAge = 18;
  int userHeight = 120;
  int userWeight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: ListView(
        primary: false,
        padding: const EdgeInsets.all(16.0),
        children: [
          /// Gender selection panel
          genderSelectionPanel(),

          /// Add space
          const SizedBox(height: 16.0),

          /// Height selection panel
          heightSelectionPanel(),

          /// Add space
          const SizedBox(height: 16.0),

          /// Weight and Age selection panel
          weightAndAgeSelectionPanel(),

          /// Add space
          const SizedBox(height: 16.0),

          /// Reset and Calculate buttons panel
          resetAndCalculateButtonsPanel(),
        ],
      ),
    );
  }

  /// Reset and Calculate buttons panel
  Container resetAndCalculateButtonsPanel() {
    return Container(
      decoration: BoxDecoration(
        color: kInactiveCardColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            /// Reset button
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Set all the user's details to initial values
                  setState(() {
                    userGender = 'Male';
                    userAge = 18;
                    userHeight = 120;
                    userWeight = 60;
                  });
                },
                child: const Text('Reset'),
              ),
            ),

            /// Add space
            const SizedBox(width: 16.0),

            /// Calculate button
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Calculate'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Weight and Age selection panel
  Row weightAndAgeSelectionPanel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Weight selection
        Expanded(
          child: WeightAndAgeSelectionButton(
            title: 'WEIGHT',
            value: userWeight.toString(),
            unit: 'Kg',
            onPressesDecrease: () {
              // Decrease the user's weight
              setState(() {
                userWeight--;
              });
            },
            onPressesIncrease: () {
              // Increase the user's weight
              setState(() {
                userWeight++;
              });
            },
          ),
        ),

        /// Add space
        const SizedBox(width: 16.0),

        /// Age selection
        Expanded(
          child: WeightAndAgeSelectionButton(
            title: 'AGE',
            value: userAge.toString(),
            unit: 'Years',
            onPressesDecrease: () {
              // Decrease the user's age
              setState(() {
                userAge--;
              });
            },
            onPressesIncrease: () {
              // Increase the user's age
              setState(() {
                userAge++;
              });
            },
          ),
        ),
      ],
    );
  }

  /// Height selection panel
  Container heightSelectionPanel() {
    return Container(
      decoration: BoxDecoration(
        color: kInactiveCardColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            /// Title
            const Text(
              'HEIGHT',
              style: kLabelTextStyle,
            ),

            /// The height in number
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  userHeight.toString(),
                  style: kNumberTextStyle,
                ),
                const Text(
                  'cm',
                  style: kLabelTextStyle,
                ),
              ],
            ),

            /// Slider
            SliderTheme(
              data: kSliderStyle,
              child: Slider(
                value: userHeight.toDouble(),
                min: 60.0,
                max: 280.0,
                onChanged: (double newHeight) {
                  // Set user's  height
                  setState(() {
                    userHeight = newHeight.round();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Gender selection panel
  Row genderSelectionPanel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Male button
        Expanded(
          child: GenderSelectionButton(
            backgroundColor:
                userGender == 'Male' ? kActiveCardColor : kInactiveCardColor,
            onPressed: () {
              // Set user's gender to male
              setState(() {
                userGender = 'Male';
              });
            },
            genderIcon: Icons.male_rounded,
            genderText: 'MALE',
          ),
        ),

        /// Add space
        const SizedBox(width: 16.0),

        /// Female button
        Expanded(
          child: GenderSelectionButton(
            backgroundColor:
                userGender == 'Female' ? kActiveCardColor : kInactiveCardColor,
            onPressed: () {
              // Set user's gender to female
              setState(() {
                userGender = 'Female';
              });
            },
            genderIcon: Icons.female_rounded,
            genderText: 'FEMALE',
          ),
        ),
      ],
    );
  }
}

/// Weight and Age selection button (Widget)
class WeightAndAgeSelectionButton extends StatelessWidget {
  const WeightAndAgeSelectionButton({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.onPressesIncrease,
    required this.onPressesDecrease,
  });

  final String title;
  final String value;
  final String unit;
  final void Function() onPressesIncrease;
  final void Function() onPressesDecrease;

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
            /// Title
            Text(
              title,
              style: kLabelTextStyle,
            ),

            /// The weight or the age in number
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: kNumberTextStyle,
                ),
                Text(
                  unit,
                  style: kLabelTextStyle,
                ),
              ],
            ),

            /// Increase and Decrease buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Decrease button
                IconButton.filledTonal(
                  onPressed: onPressesDecrease,
                  icon: const Icon(Icons.remove_rounded),
                ),

                /// Increase button
                IconButton.filledTonal(
                  onPressed: onPressesIncrease,
                  icon: const Icon(Icons.add_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Gender selection button (Widget)
class GenderSelectionButton extends StatelessWidget {
  const GenderSelectionButton({
    super.key,
    required this.onPressed,
    required this.genderIcon,
    required this.genderText,
    required this.backgroundColor,
  });

  final Color backgroundColor;
  final void Function() onPressed;
  final IconData genderIcon;
  final String genderText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Gender icon
              Icon(
                genderIcon,
                color: kIConColor,
                size: 50.0,
              ),

              /// Gender text
              Text(
                genderText,
                style: kLabelTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

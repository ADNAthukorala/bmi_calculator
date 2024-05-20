import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/calculator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        /// Appbar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackgroundColor,
          foregroundColor: kWhiteThemeColor,
          elevation: 4,
          shadowColor: kBlackThemeColor,
        ),

        /// Elevated button theme
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(kActiveCardColor),
            foregroundColor: WidgetStatePropertyAll(kWhiteThemeColor),
            textStyle: WidgetStatePropertyAll(kLabelTextStyle),
          ),
        ),

        /// Body background color
        scaffoldBackgroundColor: kBackgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: kBackgroundColor),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

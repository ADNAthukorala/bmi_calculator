import 'package:flutter/material.dart';

/// Theme colors of the app
const kBackgroundColor = Color(0xFF041B2D);
const kActiveCardColor = Color(0xFF329D9C);
const kInactiveCardColor = Color(0xFF205072);
const kIConColor = Color(0xFFCFF4D2);
const kRoundedButtonColor = Color(0xFF329D9C);
const kWhiteThemeColor = Color(0xFFFFFFFF);
const kBlackThemeColor = Color(0xFF000000);
const kResetButtonColor = Color(0xFF329D9C);
const kCalculateButtonColor = Color(0xFF329D9C);
const kOverlayColor = Color(0x1FFFFFFF);

/// BMI scale colors
const kBMIBlueThemeColor = Color(0xFF06D3B5);
const kBMIGreenThemeColor = Color(0xFF27B707);
const kBMIYellowThemeColor = Color(0xFFFCB004);
const kBMIOrangeThemeColor = Color(0xFFFA6707);
const kBMIRedThemeColor = Color(0xFFFF1700);

/// Text styles
const kLabelTextStyle = TextStyle(
  color: kIConColor,
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
);

const kNumberTextStyle = TextStyle(
  color: kIConColor,
  fontSize: 30.0,
  fontWeight: FontWeight.w500,
);

/// Slider style
const kSliderStyle = SliderThemeData(
  activeTrackColor: kActiveCardColor,
  inactiveTrackColor: kOverlayColor,
  thumbColor: kWhiteThemeColor,
  overlayColor: kOverlayColor,
  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
  overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
);

/// BMI slider style
const kBMISliderStyle = SliderThemeData(
  activeTrackColor: kBMIGreenThemeColor,
  inactiveTrackColor: kOverlayColor,
  thumbColor: Colors.transparent,
  overlayColor: Colors.transparent,
  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
  overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0),
  trackHeight: 20.0,
  allowedInteraction: SliderInteraction.slideThumb,
);

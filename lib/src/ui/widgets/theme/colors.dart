import 'package:flutter/material.dart';

const Color black = Colors.black;
const Color white = Colors.white;
const Color glaucous = Color.fromARGB(255, 110, 133, 183);
const Color lightSteelBlue = Color.fromARGB(255, 178, 200, 223);
const Color columbiaBlue = Color.fromARGB(255, 248, 249, 215);
const Color lightGoldenrodYellow = Color.fromARGB(255, 248, 249, 215);
const Color blueYonder = Color.fromARGB(255, 84, 117, 158);
const Color liberty = Color.fromARGB(255, 88, 84, 158);
const Color redwood = Color.fromARGB(255, 158, 88, 84);
const Color modernGray = Color.fromARGB(255, 111, 110, 114);
const Color beige = Color.fromARGB(255, 245, 247, 217);
const Color goldGlaze = Color.fromARGB(255, 215, 173, 0);
const Color tuxedoGrey = Color.fromARGB(255, 84, 84, 78);
const Color brushedSilver = Color.fromARGB(255, 193, 196, 199);
const Color americanBlue = Color.fromARGB(255, 59, 67, 113);
const Color royalOrange = Color.fromARGB(255, 243, 144, 79);
const Color gunMetal = Color.fromARGB(255, 22, 34, 42);
const Color deepSpaceSparkle = Color.fromARGB(255, 58, 96, 115);
const Color loginGradientStart = Color(0xFFfbab66);
const Color loginGradientEnd = Color(0xFFf7418c);

const LinearGradient secondaryGradient = LinearGradient(
  colors: [loginGradientStart, loginGradientEnd],
  stops: <double>[0.0, 1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const LinearGradient primaryGradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [gunMetal, deepSpaceSparkle],
);

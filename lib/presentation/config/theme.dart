import 'package:flutter/material.dart';
import 'package:islom_test/presentation/config/constants.dart';

// Color getColor(Set<MaterialState> states) {
//   const Set<MaterialState> interactiveStates = <MaterialState>{
//     MaterialState.pressed,
//     MaterialState.hovered,
//     MaterialState.focused,
//   };
//   return primaryColor;
// }

final theme = ThemeData(
  scaffoldBackgroundColor: primaryColor,
  fontFamily: 'Muli',
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
  ),
  appBarTheme: const AppBarTheme(
    color: primaryColor,
    elevation: 0,
    // systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Color(0x8B8B8B8B), fontSize: 18),
  ),
  primarySwatch: Colors.blue,
);

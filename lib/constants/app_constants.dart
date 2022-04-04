// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Sabitler {
  static const MaterialColor anaRenk = Colors.purple;
  static const String baslikText = "Umut";
  static final TextStyle baslikStyle = TextStyle(
      fontFamily: "RobotoMono",
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: anaRenk);
  static BorderRadius borderRadius = BorderRadius.circular(16);

  static final TextStyle dersSayisiStyle = TextStyle(
      fontFamily: "RobotoMono",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: anaRenk);

  static final TextStyle ortalamaStyle = TextStyle(
      fontFamily: "RobotoMono",
      fontSize: 55,
      fontWeight: FontWeight.w800,
      color: anaRenk);

  static final dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
}

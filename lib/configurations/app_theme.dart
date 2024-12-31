import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class AppTheme {
  static const Color mainColor = Color(0xFF452CE8);
  static const Color maingrey = Color(0xFF68656E);

  static const Color lightPrimary = Color(0xFFFBFBFC);
  static const Color lightSecondary = AppTheme.darkPrimary;

  static const Color darkSecondary = Color(0xFFFBFBFC);
  static const Color darkPrimary = Color(0xFF323135);
}

import 'package:flutter/material.dart';

class AppColors {
  static const Color darkNavy = Color(0xFF312C51);
  static const Color softViolet = Color(0xFF48426D);
  static const Color warmBeige = Color(0xFFF0C38E);
  static const Color warmPink = Color(0xFFF1AA9B);

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      darkNavy,
      softViolet,
    ],
  );
}

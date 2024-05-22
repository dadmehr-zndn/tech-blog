import 'package:flutter/material.dart';
import 'package:tech_blog/constants/constants.dart';

class Decorations {
  static BoxDecoration mainGradientBoxDecoration = BoxDecoration(
    //TODO: check for the exact redius
    borderRadius: BorderRadius.circular(16),
    gradient: const LinearGradient(colors: GradientColors.bottomNavigation),
  );
}

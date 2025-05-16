import 'package:flutter/material.dart';

class AppConstantsColor {
  static const Color lightBrown = Color(0xFFD7CCC8);
  static const Color darkBrown = Color(0xFF5D4037);
  static const Color white = Colors.white;
}

class AppTextStyles {
  static const TextStyle subHeader = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.darkBrown,
  );
}

class AppButtonStyle {
  static final ButtonStyle primary = ElevatedButton.styleFrom(
    backgroundColor: AppConstantsColor.darkBrown,
    foregroundColor: AppConstantsColor.white,
    textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    padding: const EdgeInsets.symmetric(vertical: 14),
  );
}

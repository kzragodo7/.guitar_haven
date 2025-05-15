import 'package:flutter/material.dart';

class AppConstantsColor {
  static const Color lightBrown = Color(0xFFD7CCC8); // Light brown
  static const Color darkBrown = Color(0xFF5D4037); // Dark brown
  static const Color white = Colors.white;

  static const Color primaryColor = darkBrown;
  static const Color darkTextColor = Colors.black87;
  static const Color accentColor = Colors.brown; // You can customize this
}

class AppTextStyles {
  static const TextStyle header = TextStyle(
    fontFamily: 'Merriweather',
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.primaryColor,
  );

  static const TextStyle subHeader = TextStyle(
    fontFamily: 'Merriweather',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppConstantsColor.darkTextColor,
  );

  static const TextStyle productTitle = TextStyle(
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppConstantsColor.darkTextColor,
  );

  static const TextStyle priceText = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.accentColor,
  );
}

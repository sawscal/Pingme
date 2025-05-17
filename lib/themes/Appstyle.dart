import 'dart:ui';

import 'package:flutter/material.dart';

class AppStyles {
  // Colors
  static const Color primaryButtonColor = Color(0xFF333333);
  static const Color backgroundColor = Colors.white;
  static const Color textPrimaryColor = Colors.black;
  static const Color textSecondaryColor = Colors.grey;
  
  // Text styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
  );
  
  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 16,
    color: textSecondaryColor,
  );
  
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16, 
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  
  // Button styles
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryButtonColor,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
import 'dart:ui';

import 'package:flutter/material.dart';

TextStyle logoStyle() {
  return TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 1);
}

TextStyle headingStyle() {
  return TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}

TextStyle greySubTextStyle() {
  return const TextStyle(
    color: Colors.grey,
    fontSize: 36,
    fontWeight: FontWeight.w600,
  );
}

TextStyle bottomNoteStyle() {
  return const TextStyle(fontSize: 12, color: Colors.grey);
}

TextStyle bottomNoteLinkStyle() {
  return const TextStyle(decoration: TextDecoration.underline);
}

TextStyle onboardingPromptStyle() {
  return  TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.grey[700],
  );  
}
// TextStyle buttonTexttStyle() {
//   return TextStyle(
//     color: Colors.white, // Text color
//     fontWeight: FontWeight.bold,
//     fontSize: 16,
//   );
// }

TextStyle buttonTextStyle() {
  return const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    letterSpacing: .5,
    fontSize: 16,
    color: Colors.white
  );
}

          
        


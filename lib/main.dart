import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ping_me/firebase_options.dart';
import 'package:ping_me/function/auth_gate.dart';
import 'package:ping_me/function/login_or_register.dart';
import 'package:ping_me/screens/authentication/login.dart';
import 'package:ping_me/screens/authentication/onbording.dart';
import 'package:ping_me/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PING ME',
      debugShowCheckedModeBanner: false,
      theme:// lightMode, 
         ThemeData(fontFamily: 'SF Pro'),
      home: OnboardingScreen(),
    );
  }
}

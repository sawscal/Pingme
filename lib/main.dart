import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ping_me/firebase_options.dart';
import 'package:ping_me/screens/authentication/onbording.dart';
import 'package:ping_me/screens/home/home_screen.dart';
import 'package:ping_me/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //  final ipfs = IpfsHttpService();

  // final hash = await ipfs.upload('Hello QuantumMessenger!');
  // print('Uploaded with CID: $hash');

  // final data = await ipfs.fetch(hash!);
  // print('Fetched from IPFS: $data');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'PING ME',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      // ThemeData(fontFamily: 'SF Pro'),
      initialRoute: '/', // Initial route can be onboarding screen
      routes: {
        '/': (context) => const OnboardingScreen(),
        //'/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        //'/notifications': (context) => const NotificationsScreen(),
        //'/chat': (context) => const ChatScreen(roomId: 'defaultRoom'),
      },
    );
  }
}




// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:ping_me/components/my_button.dart';
// import 'package:ping_me/components/my_textfiled.dart';
// import 'package:ping_me/service/auth_service.dart';

// class Login extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final void Function()? onTap;

//   Login({super.key, required this.onTap});

//   void login(BuildContext context) async {
//     final _authService = AuthService();

//     try {
//       // // Replace these with actual user input values
//       // String email = 'user@example.com';
//       // String password = 'password123';

//       UserCredential userCredential = await _authService
//           .signInWithEmailPassword(
//             _emailController.text,
//             _passwordController.text,
//           );
//       // print("Login successful: ${userCredential.user?.email}");
//     } catch (e) {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(title: Text(e.toString()),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.message,
//             size: 60,
//             color: Theme.of(context).colorScheme.primary,
//           ),
//           Text(
//             "Welcome back you have being missed",
//             style: TextStyle(
//               color: Theme.of(context).colorScheme.primary,
//               fontSize: 16,
//             ),
//           ),
//           const SizedBox(height: 25),
//           MyTextfiled(
//             hintText: "Email",
//             obscureText: false,
//             controller: _emailController,
//           ),
//           const SizedBox(height: 10),
//           MyTextfiled(
//             hintText: "Password",
//             obscureText: true,
//             controller: _passwordController,
//           ),

//           const SizedBox(height: 25),
//           MyButton(text: "Login", onTap: () => login(context)),
//           const SizedBox(height: 25),
//           Text(
//             "Not a memeber?",
//             style: TextStyle(color: Theme.of(context).colorScheme.primary),
//           ),
//           GestureDetector(
//             onTap: onTap,
//             child: Text(
//               " Register now",

//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ping_me/components/my_button.dart';
import 'package:ping_me/components/my_textfiled.dart';
import 'package:ping_me/service/auth_service.dart';

class Login extends StatefulWidget {
  final void Function()? onTap;

  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login(BuildContext context) async {
    final _authService = AuthService();

    try {
      UserCredential userCredential = await _authService.signInWithEmailPassword(
        _emailController.text,
        _passwordController.text,
      );
      // Successful login handling here
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.message, size: 60, color: Theme.of(context).colorScheme.primary),
          Text(
            "Welcome back you have been missed",
            style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 16),
          ),
          const SizedBox(height: 25),
          MyTextfiled(hintText: "Email", obscureText: false, controller: _emailController),
          const SizedBox(height: 10),
          MyTextfiled(hintText: "Password", obscureText: true, controller: _passwordController),
          const SizedBox(height: 25),
          MyButton(
            text: "Login",
             onTap: () => login(context),
              borderRadius: 8,
               padding: 25, 
               horizontalMargin: 25, 
               verticalMargin: 0,
                color: Theme.of(context).colorScheme.secondary ,
                // margin: 25,
             ),
          const SizedBox(height: 25),
          Text("Not a member?", style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          GestureDetector(
            onTap: widget.onTap,
            child: Text(
              " Register now",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

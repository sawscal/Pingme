import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ping_me/components/my_button.dart';
import 'package:ping_me/components/my_textfiled.dart';
import 'package:ping_me/screens/home/home_screen.dart';
import 'package:ping_me/service/auth_service.dart';
// Import your HomeScreen

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
      UserCredential userCredential =
          await _authService.signInWithEmailPassword(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      // ✅ Navigate to HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
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
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.message,
              size: 60, color: Theme.of(context).colorScheme.primary),
          Text(
            "Welcome back you have been missed",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 16),
          ),
          const SizedBox(height: 25),
          MyTextfiled(
              hintText: "Email",
              obscureText: false,
              controller: _emailController),
          const SizedBox(height: 10),
          MyTextfiled(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController),
          const SizedBox(height: 25),
          MyButton(
            text: "Login",
            onTap: () => login(context),
            borderRadius: 8,
            padding: 25,
            horizontalMargin: 25,
            verticalMargin: 0,
            color: Theme.of(context).colorScheme.secondary,
            textColor: Colors.black,
          ),
          const SizedBox(height: 25),
          Text("Not a member?",
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
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

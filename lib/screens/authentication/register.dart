import 'package:flutter/material.dart';
import 'package:ping_me/components/my_button.dart';
import 'package:ping_me/components/my_textfiled.dart';
import 'package:ping_me/service/auth_service.dart';

class Register extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  final void Function()? onTap;
  Register({super.key, required this.onTap});
  void register(BuildContext context) async {
  final _auth = AuthService();

 // passwors match then create user
  if (_passwordController.text == _confirmpasswordController.text) {
    try {
      await _auth.signUpWithEmailPassword(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      }catch(e){
        showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString()),
        ),
      );
      }
    }
   // password don't match then error (ps: user fix it)
   else{
     showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords don't match") ,
        ),
      );
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          Text(
            "Let's create an account for you",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 25),
          MyTextfiled(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,
          ),
          const SizedBox(height: 10),
          MyTextfiled(
            hintText: "Password",
            obscureText: true,
            controller: _passwordController,
          ),
          const SizedBox(height: 10),
          MyTextfiled(
            hintText: "Password",
            obscureText: true,
            controller: _confirmpasswordController,
          ),

          const SizedBox(height: 25),
          MyButton(
            text: "Register", 
            onTap: () => register(context),
             borderRadius: 12,
              padding: 16, 
              horizontalMargin: 25,
               verticalMargin: 0,
                color: Theme.of(context).colorScheme.secondary,
            ),
          const SizedBox(height: 25),
          Text(
            "Already have a account ?",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: onTap,
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

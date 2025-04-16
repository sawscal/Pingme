import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ping_me/components/my_button.dart';
import 'package:ping_me/screens/authentication/login.dart';
import 'package:ping_me/themes/style.dart';

// Onboarding Screen
class OnboardingScreen extends StatelessWidget {
  @override
//  void _handleAppleSignUp() {
//     print("Sign up with Apple tapped");
//     // Add your logic here (e.g., authentication, navigation, etc.)
//   }

 void _handleLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(
          onTap: () {
            // TODO: Navigate to register page if needed
          },
        ),
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text("PINGme",
                style: logoStyle(),
              ),
              const SizedBox(height: 325),
              RichText(
                text: TextSpan(
                  style: headingStyle(),
                  children: [
                    const TextSpan(text: 'chat '),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/man.png'),
                      ),
                    ),
                    const TextSpan(text: ' rooms\n'),
                    TextSpan(
                      text: 'with the ',
                      style: greySubTextStyle(),
                    ),
                    const TextSpan(text: 'most\n'),
                    const TextSpan(text: 'valuable '),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/ancestors.png'),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
          MyButton(
           borderRadius: 12,
           padding: 16,
           horizontalMargin: 0,
           verticalMargin: 0,
           color: Color.fromARGB(255, 151, 49, 180),
            onTap: () {
    // Handle Google sign-up
             },
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(Icons.g_mobiledata, size: 24, color: Colors.black),
      const SizedBox(width: 10),
      Text(
        'Sign up with Google',
        style: buttonTextStyle(),
      ),
    ],
  ),
),

              const SizedBox(height: 12),
            MyButton(
             text: 'I have an account',
                borderRadius: 12,
                padding: 16,
                onTap: () => _handleLogin(context), 
                 horizontalMargin: 0, 
                 verticalMargin: 16, 
                 color: Theme.of(context).colorScheme.secondary,
                ),
              const SizedBox(height: 16),

              Text.rich(
                TextSpan(
                  text: 'By continuing you confirm that you agree to our ',
                  style: bottomNoteStyle(),
                  children: [
                    TextSpan(
                      text: 'Terms of Service, Privacy Policy',
                      style: bottomNoteLinkStyle(),
                    ),
                    const TextSpan(
                        text:
                            ' and good behavior in chat with users (write to your loved ones more often 🕊).'),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}











import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ping_me/components/my_button.dart';
import 'package:ping_me/screens/authentication/login.dart';
import 'package:ping_me/themes/Textstyle.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/calendar.events',
        ],
        clientId:
            '103241477938-n064j07bhu337shblkicetvhvd40f1b5.apps.googleusercontent.com',
      );

      final account = await _googleSignIn.signIn();
      final auth = await account?.authentication;

      if (account != null && auth != null) {
        final accessToken = auth.accessToken;
        print("✅ Google Sign-In successful");
        print("Access Token: $accessToken");

        // TODO: Create calendar event if needed
        // await createCalendarEvent(accessToken!);

        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Google Sign-In was cancelled.')),
        );
      }
    } catch (e) {
      print("❌ Google Sign-In error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

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

  @override
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
              Text("PINGme", style: logoStyle()),
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
                        backgroundImage: AssetImage('assets/images/man.png'),
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
                        backgroundImage:
                            AssetImage('assets/images/ancestors.png'),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),

              // 👉 Sign in with Google Button
              MyButton(
                text: 'Sign up with Google',
                borderRadius: 12,
                padding: 16,
                horizontalMargin: 0,
                verticalMargin: 0,
                color: Colors.deepPurple.shade400,
                textColor: Colors.white,
                icon: const Icon(Icons.g_mobiledata, size: 24, color: Colors.white),
                textStyle: buttonTextStyle(),
                onTap: () => signInWithGoogle(context),
              ),

              const SizedBox(height: 12),

              // 👉 Already have account button
              MyButton(
                text: 'I have an account',
                borderRadius: 12,
                padding: 16,
                horizontalMargin: 0,
                verticalMargin: 16,
                color: Theme.of(context).colorScheme.secondary,
                textColor: Colors.black,
                onTap: () => _handleLogin(context),
              ),

              const SizedBox(height: 16),

              // 👉 Terms text
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
                          ' and good behavior in chat with users (write to your loved ones more often 🕊).',
                    ),
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

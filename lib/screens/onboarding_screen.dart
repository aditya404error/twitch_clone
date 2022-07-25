import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitch_clone/main.dart';
import 'package:twitch_clone/screens/login_screen.dart';
import 'package:twitch_clone/screens/signup_screen.dart';
import 'package:twitch_clone/widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = '/onboardingScreen';
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: const Icon(Icons.abc),
        title: const Text('Hello'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome to\nTwitch',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.4,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  CustomButton(
                      text: 'Login',
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      }),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomButton(text: 'Signup', onTap: () {
                    Navigator.pushNamed(context, SignupScreen.routeName);
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

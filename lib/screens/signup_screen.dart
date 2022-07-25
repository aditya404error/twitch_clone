import 'package:flutter/material.dart';
import 'package:twitch_clone/resources/auth_methods.dart';
import 'package:twitch_clone/screens/home_screen.dart';
import 'package:twitch_clone/widgets/custom_button.dart';
import 'package:twitch_clone/widgets/custom_text_field.dart';

import '../widgets/loading.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signupScreen';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthMethod _authMethod = AuthMethod();
  bool _isLoading = false;

  void signupUser() async {
    setState(() {
      _isLoading = true;
    });
    bool res = await _authMethod.signupUser(
      context,
      _emailController.text.trim(),
      _usernameController.text.trim(),
      _passwordController.text.trim(),
    );
    setState(() {
      _isLoading = true;
    });

    if (res) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: const Icon(Icons.gamepad),
        title: const Text('Signup'),
      ),
      body: _isLoading
          ? const LoadingIndicator()
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(24),
                width: size.width,
                height: size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    CustomTextfield(
                      text: 'Username',
                      hideText: false,
                      hintLable: 'Enter a username',
                      textController: _usernameController,
                    ),
                    CustomTextfield(
                      text: 'Email ID',
                      hideText: false,
                      hintLable: 'Enter your email ID',
                      textController: _emailController,
                    ),
                    CustomTextfield(
                      text: 'Password',
                      hideText: true,
                      hintLable: 'Enter a strong password',
                      textController: _passwordController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomButton(
                      text: 'Signup',
                      onTap: signupUser,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

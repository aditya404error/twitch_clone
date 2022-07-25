import 'package:flutter/material.dart';
import 'package:twitch_clone/resources/auth_methods.dart';
import 'package:twitch_clone/widgets/loading.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/loginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthMethod _authMethod = AuthMethod();
  bool _isLoading = false;

  loginUser() async {
    setState(() {
      _isLoading = true;
    });
    bool res = await _authMethod.loginUser(
      context,
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
    setState(() {
      _isLoading = false;
    });
    if (res) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
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
                      text: 'Login',
                      onTap: loginUser,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

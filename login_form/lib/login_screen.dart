import 'package:flutter/material.dart';
import 'package:login_form/widget/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/signin_balls.png'),
                const Text(
                  'Sign in',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
                const SizedBox(height: 50),
                const SocialButton(iconPath: 'assets/svgs/g_logo.svg', label:'Continue with Google'),
                const SizedBox(height: 20),
                const SocialButton(iconPath: 'assets/svgs/f_logo.svg', label:'Continue with Facebook'),
                const Text('or', style: TextStyle(fontSize: 17)),
                const SizedBox(height: 15),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

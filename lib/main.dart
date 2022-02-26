import 'package:f_login_form/signup_screen.dart';
import 'package:f_login_form/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SignupApp());
}

class SignupApp extends StatelessWidget {
  const SignupApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SignupScreen.RouteName: (_) => const SignupScreen(),
        WelcomeScreen.RouteName: (_) => const WelcomeScreen(),
      },
    );
  }
}

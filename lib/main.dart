
import 'package:flutter/material.dart';

import 'feature/app_section/app_section.dart';
import 'feature/auth/view/login_screen.dart';
import 'feature/auth/view/register_screen.dart';
import 'feature/onboarding/onboarding_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "User App",
      initialRoute: AppSection.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        AppSection.routeName: (context) => const AppSection(),
      },
    );
  }
}

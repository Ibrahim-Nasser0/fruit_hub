import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Text(
          'Login View',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

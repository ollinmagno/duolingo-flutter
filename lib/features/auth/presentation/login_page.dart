import 'package:duolingo/features/home/presentation/home_shell.dart';
import 'package:duolingo/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: PrimaryButton(
              "ENTRAR",
              color: const Color(0xFF1AB1F6),
              onPressed: () => HomeShell.open(context),
            ),
          ),
        ),
      );
}

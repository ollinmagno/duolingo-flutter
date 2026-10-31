import 'package:duolingo/features/auth/presentation/login_page.dart';
import 'package:duolingo/features/home/presentation/home_shell.dart';
import 'package:duolingo/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/logo-with-duo.png",
                            width: 270,
                            semanticLabel: "Duolingo",
                          ),
                          const SizedBox(height: 22),
                          Text(
                            "Aprenda idiomas de graça. Agora e sempre.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                PrimaryButton(
                  "COMEÇAR AGORA",
                  onPressed: () => HomeShell.open(context),
                ),
                const SizedBox(height: 12),
                PrimaryButton(
                  "JÁ TENHO UMA CONTA",
                  color: Colors.white,
                  textColor: Colors.green,
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (_) => const LoginPage()),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

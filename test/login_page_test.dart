import 'package:duolingo/features/auth/presentation/login_page.dart';
import 'package:duolingo/features/home/presentation/home_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("login mostra apenas o botao ENTRAR", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text("ENTRAR"), findsOneWidget);
    expect(find.byType(TextField), findsNothing);
  });

  testWidgets("tocar em ENTRAR abre a Home", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    await tester.tap(find.text("ENTRAR"));
    await tester.pumpAndSettle();

    expect(find.byType(HomeShell), findsOneWidget);
  });
}

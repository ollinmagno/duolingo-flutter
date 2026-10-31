import 'package:duolingo/features/auth/presentation/login_page.dart';
import 'package:duolingo/features/auth/presentation/welcome_screen.dart';
import 'package:duolingo/features/home/presentation/home_shell.dart';
import 'package:duolingo/features/lessons/presentation/lesson_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> setScreen(WidgetTester tester, Size size) async {
    tester.binding.window.physicalSizeTestValue = size;
    tester.binding.window.devicePixelRatioTestValue = 1;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    addTearDown(tester.binding.window.clearDevicePixelRatioTestValue);
  }

  int currentTab(WidgetTester tester) => tester
      .widget<BottomNavigationBar>(find.byType(BottomNavigationBar))
      .currentIndex;

  testWidgets("COMECAR AGORA abre a Home sem volta", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: WelcomeScreen()));

    await tester.tap(find.text("COMEÇAR AGORA"));
    await tester.pumpAndSettle();

    expect(find.byType(HomeShell), findsOneWidget);
    expect(find.byType(WelcomeScreen), findsNothing);
    expect(
        tester.state<NavigatorState>(find.byType(Navigator)).canPop(), isFalse);
  });

  testWidgets("JA TENHO UMA CONTA abre o login", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: WelcomeScreen()));

    await tester.tap(find.text("JÁ TENHO UMA CONTA"));
    await tester.pumpAndSettle();

    expect(find.byType(LoginPage), findsOneWidget);
  });

  testWidgets("tocar em uma aba troca a aba ativa", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeShell()));
    expect(currentTab(tester), 0);

    const List<String> tabs = <String>[
      "Lições",
      "Histórias",
      "Perfil",
      "Ranking",
      "Loja",
    ];
    for (final from in tabs) {
      for (final to in tabs) {
        await tester.tap(find.byTooltip(from));
        await tester.pump();
        await tester.tap(find.byTooltip(to));
        await tester.pump();

        expect(currentTab(tester), tabs.indexOf(to));
      }
    }
  });

  Finder lessonCircle(String title) => find.descendant(
        of: find.ancestor(
          of: find.text(title),
          matching: find.byType(LessonBubble),
        ),
        matching: find.byType(InkWell),
      );

  testWidgets("tocar no ovo abre o painel e ENTENDI fecha", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeShell()));
    expect(find.text("ENTENDI"), findsNothing);

    await tester.tap(lessonCircle("Introdução"));
    await tester.pumpAndSettle();

    expect(find.text("Esta lição estará disponível em breve."), findsOneWidget);

    await tester.tap(find.text("ENTENDI"));
    await tester.pumpAndSettle();

    expect(find.text("ENTENDI"), findsNothing);
  });

  testWidgets("tocar em outra licao nao abre o painel", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeShell()));

    await tester.tap(lessonCircle("Viagem"));
    await tester.pumpAndSettle();

    expect(find.text("ENTENDI"), findsNothing);
  });

  testWidgets("trocar de aba preserva a rolagem das licoes", (tester) async {
    await setScreen(tester, const Size(320, 568));
    await tester.pumpWidget(const MaterialApp(home: HomeShell()));

    final Finder lessons = find.byType(Scrollable).first;
    await tester.drag(lessons, const Offset(0, -150));
    await tester.pumpAndSettle();
    final double offset =
        tester.state<ScrollableState>(lessons).position.pixels;
    expect(offset, greaterThan(0));

    await tester.tap(find.byTooltip("Loja"));
    await tester.pump();
    await tester.tap(find.byTooltip("Lições"));
    await tester.pump();

    expect(tester.state<ScrollableState>(lessons).position.pixels, offset);
  });

  for (final size in const <Size>[Size(320, 568), Size(412, 915)]) {
    testWidgets("nenhuma tela estoura em ${size.width.toInt()}px",
        (tester) async {
      await setScreen(tester, size);

      await tester.pumpWidget(const MaterialApp(home: WelcomeScreen()));
      await tester.pumpAndSettle();
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));
      await tester.pumpAndSettle();

      await tester.pumpWidget(const MaterialApp(home: HomeShell()));
      for (final tab in const <String>[
        "Histórias",
        "Perfil",
        "Ranking",
        "Loja",
        "Lições"
      ]) {
        await tester.tap(find.byTooltip(tab));
        await tester.pump();
      }
    });
  }
}

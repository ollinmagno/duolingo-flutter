import 'package:duolingo/features/home/presentation/stats_app_bar.dart';
import 'package:duolingo/features/lessons/presentation/lessons_screen.dart';
import 'package:duolingo/features/profile/presentation/profile_screen.dart';
import 'package:duolingo/shared/widgets/coming_soon.dart';
import 'package:flutter/material.dart';

class _Tab {
  final String label;
  final String icon;
  final Widget screen;

  const _Tab(this.label, this.icon, this.screen);

  String get asset => "assets/images/bottom_navigation_bar/tab_$icon.png";
  String get selectedAsset =>
      "assets/images/bottom_navigation_bar/tab_${icon}_selected.png";
}

const List<_Tab> _tabs = <_Tab>[
  _Tab("Lições", "lessons", LessonsScreen()),
  _Tab("Histórias", "stories", ComingSoon("Histórias")),
  _Tab("Perfil", "profile", ProfileScreen()),
  _Tab("Ranking", "ranking", ComingSoon("Ranking")),
  _Tab("Loja", "store", ComingSoon("Loja")),
];

class HomeShell extends StatefulWidget {
  const HomeShell();

  // Sem volta para as telas de entrada: quem entrou já está no app.
  static void open(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<void>(builder: (_) => const HomeShell()),
      (_) => false,
    );
  }

  @override
  _HomeShellState createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const StatsAppBar(),
        body: IndexedStack(
          index: _currentIndex,
          children: <Widget>[for (final tab in _tabs) tab.screen],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) => setState(() => _currentIndex = index),
          items: <BottomNavigationBarItem>[
            for (final tab in _tabs)
              BottomNavigationBarItem(
                icon: Image.asset(tab.asset, height: 36, gaplessPlayback: true),
                activeIcon: Image.asset(
                  tab.selectedAsset,
                  height: 44,
                  gaplessPlayback: true,
                ),
                label: tab.label,
              ),
          ],
        ),
      );
}

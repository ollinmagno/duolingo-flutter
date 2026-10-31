import 'package:duolingo/core/demo_stats.dart';
import 'package:flutter/material.dart';

class StatsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StatsAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              "assets/images/appBar/flag.png",
              height: 29,
              semanticLabel: "Idioma",
            ),
            const _Stat("crown_stroke", demoCrowns, Colors.amber, "Coroas"),
            const _Stat("navbar_fire", demoStreak, Colors.grey, "Ofensiva"),
            const _Stat("navbar_diamont", demoGems, Colors.red, "Gemas"),
          ],
        ),
      );
}

class _Stat extends StatelessWidget {
  final String icon;
  final int value;
  final Color color;
  final String label;

  const _Stat(this.icon, this.value, this.color, this.label);

  @override
  Widget build(BuildContext context) => Semantics(
        label: "$label: $value",
        excludeSemantics: true,
        child: Row(
          children: <Widget>[
            Image.asset("assets/images/appBar/$icon.png", height: 29),
            const SizedBox(width: 6),
            Text(
              "$value",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
                fontSize: 17,
              ),
            ),
          ],
        ),
      );
}

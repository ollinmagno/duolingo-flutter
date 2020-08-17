import 'package:duolingo/src/pages/main_screen/appbar_home_screen.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    var appBar = AppBarHomeScreen();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: appBar,
      ),
    );
  }
}
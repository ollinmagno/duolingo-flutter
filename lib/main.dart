import 'package:duolingo/src/pages/login/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      //
    ],
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]); 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Duolingo",
      theme: ThemeData(primaryColor: Colors.white),
      home: WelcomeScreen(),
    );
  }
}

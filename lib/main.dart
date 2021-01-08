import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/home/login/welcome_screen.dart';


void main() => runApp(MyApp());

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

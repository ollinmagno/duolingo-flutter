import 'package:duolingo/src/components/circle_avatar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Text _textCirle(String text) =>
      Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 38),
          Column(
            children: <Widget>[
              const CircleAvatarIndicator(Color(0xFF55acf3),
                  "assets/images/home_screen/lesson_egg.png"),
              const SizedBox(height: 10),
              _textCirle("Introdução"),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const CircleAvatarIndicator(Color(0xFF55acf3),
                          "assets/images/home_screen/lesson_dialog.png"),
                      const SizedBox(height: 10),
                      _textCirle("Saudações"),
                    ],
                  ),
                  const SizedBox(width: 33),
                  Column(
                    children: <Widget>[
                      const CircleAvatarIndicator(Color(0xFF55acf3),
                          "assets/images/home_screen/lesson_airplane.png"),
                      const SizedBox(height: 10),
                      _textCirle("Viagem"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const CircleAvatarIndicator(Color(0xFF55acf3),
                          "assets/images/home_screen/lesson_hamburger.png"),
                      const SizedBox(height: 10),
                      _textCirle("Cafeteria"),
                    ],
                  ),
                  const SizedBox(width: 33),
                  Column(
                    children: <Widget>[
                      const CircleAvatarIndicator(Color(0xFF55acf3),
                          "assets/images/home_screen/lesson_baby.png"),
                      const SizedBox(height: 10),
                      _textCirle("Famílias"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(crossAxisAlignment: CrossAxisAlignment.end, children: <
                  Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 15),
                      child: Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                ),
                Image.asset(
                  "assets/images/home_screen/lesson_divisor_castle.png",
                  height: 85,
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 15, right: 10),
                      child: Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}

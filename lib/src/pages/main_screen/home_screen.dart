import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _circleAvatar(String img, Color backgroundColor, double height) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      child: Image.asset(
        img,
        height: height,
      ),
      radius: 56.0,
    );
  }

  _textCirle(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  _body() {
    return ListView(
      children: <Widget>[
        SizedBox(height: 38),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _circleAvatar('assets/images/home_screen/lesson_egg.png',
                Color(0xFF55acf3), 58),
            SizedBox(height: 10),
            _textCirle('Introdução'),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _circleAvatar('assets/images/home_screen/lesson_dialog.png',
                        Color(0xFF55acf3), 58),
                    SizedBox(height: 10),
                    _textCirle('Saudações'),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: <Widget>[
                    _circleAvatar(
                        'assets/images/home_screen/lesson_airplane.png',
                        Color(0xFF55acf3),
                        58),
                    SizedBox(height: 10),
                    _textCirle('Viagem'),
                  ],
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _circleAvatar(
                        'assets/images/home_screen/lesson_hamburger.png',
                        Color(0xFF55acf3),
                        58),
                    SizedBox(height: 10),
                    _textCirle('Cafeteria'),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: <Widget>[
                    _circleAvatar('assets/images/home_screen/lesson_baby.png',
                        Color(0xFF55acf3), 58),
                    SizedBox(height: 10),
                    _textCirle('Famílias'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                    child: Divider(
                      color: Colors.black,
                      height: 50,
                    )),
              ),
              Image.asset(
                'assets/images/home_screen/lesson_divisor_castle.png',
                height: 85,
              ),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                    child: Divider(
                      color: Colors.black,
                      height: 50,
                    )),
              ),
            ]),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            padding: EdgeInsets.only(left: 16.0),
            icon: Image.asset('assets/images/appBar/flag.png'),
            onPressed: () {},
          ),
          elevation: 5,
          actions: <Widget>[
            Row(
              children: [
                IconButton(
                  icon: Image.asset(
                    'assets/images/appBar/crown_stroke.png',
                    height: 29,
                  ),
                  onPressed: () {},
                ),
                Text(
                  '67',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                      fontSize: 17),
                ),
                SizedBox(
                  width: 30,
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/images/appBar/navbar_fire.png',
                    height: 29,
                  ),
                  onPressed: () {},
                ),
                Text('50',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 17)),
                SizedBox(
                  width: 40,
                ),
                IconButton(
                  padding: EdgeInsets.only(left: 16.0),
                  icon: Image.asset(
                    'assets/images/appBar/navbar_diamont.png',
                    height: 29,
                  ),
                  onPressed: () {},
                ),
                Text(
                  '130',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 17),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        ),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.device_hub,
          color: Colors.blue,
        ),
        onPressed: () {},
      ),
    );
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _body() {
    return ListView(
      children: <Widget>[],
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
            IconButton(
              padding: EdgeInsets.only(right: 16.0),
              icon: Image.asset('assets/images/appBar/crown_stroke.png'),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.only(left: 16.0),
              icon: Image.asset('assets/images/appBar/navbar_fire.png'),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.only(left: 16.0),
              icon: Image.asset('assets/images/appBar/navbar_diamont.png'),
              onPressed: () {},
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

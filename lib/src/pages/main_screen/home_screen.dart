import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _body(){
    return ListView(
      children: <Widget>[

      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset('assets/images/appBar/flag.png'),
        actions: <Widget>[
          Image.asset('assets/images/appBar/navbar_diamont.png'),
        ],
      ),

      body: _body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.device_hub, color: Colors.blue,),
        onPressed: (){},
      ),
    );
  }
}
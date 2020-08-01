import 'package:duolingo/src/pages/login/login_app.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  _body(context){
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 125.0, left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo-with-duo.png', width: 270,),
            SizedBox(height: 22,),
            SizedBox(
              width: 280,
              child: Text('Aprenda idiomas de graça. Agora e sempre.', style:
              TextStyle(fontSize: 26, color: Colors.grey.shade400,),),
            ),
            Flexible(child: FractionallySizedBox(heightFactor: 0.75,),),
            _button('COMEÇAR AGORA', color: Colors.lightGreen, onPressed: (){}, colorText: Colors.white),
            SizedBox(height: 12,),
            _button('JÁ TENHO UMA CONTA', color: Colors.white, onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginApp()));
                  }, colorText: Colors.green),
                ],
            ),
      ),
    );
  }
  _button(String text, {Color color, Color colorText, Function onPressed}){
    return Container(
      width: 350,
      height: 60,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 12,
          offset: Offset(0, 2),
        ),
      ]),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0),),
        color: color,
        child: Text(text, style: TextStyle(color: colorText, fontSize: 23, fontWeight: FontWeight.bold),),
        onPressed: onPressed,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }
}
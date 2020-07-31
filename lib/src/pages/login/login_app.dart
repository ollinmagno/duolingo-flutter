import 'package:duolingo/src/pages/main_screen/home_screen.dart';
import 'package:duolingo/src/widgets/login_text_field.dart';
import 'package:duolingo/src/widgets/login_text_field.dart';
import 'package:flutter/material.dart';

class LoginApp extends StatelessWidget {
  final _controllerLogin = TextEditingController();
  final _controllerPassword = TextEditingController();

  _body(context){
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 80, left: 16.0, right: 16.0, bottom: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Insira seus dados', style:
              TextStyle(color: Colors.grey.shade400, fontSize: 23, fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),

              LoginTextField(context, 'Usuário ou email', controller: _controllerLogin,),
              LoginTextField(context, 'Senha', controller: _controllerPassword, obscure: true,),

              SizedBox(height: 20,),
              _button('ENTRAR', color: Colors.lightBlueAccent, colorText: Colors.white,onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              }),
              SizedBox(height: 38,),
              Text('ESQUECI A SENHA', style:
              TextStyle(color: Colors.lightBlueAccent, fontSize: 23, fontWeight: FontWeight.bold),),
            ],
          ),
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
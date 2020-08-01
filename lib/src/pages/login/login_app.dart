import 'package:duolingo/src/pages/main_screen/home_screen.dart';
import 'package:duolingo/src/widgets/login_text_field.dart';
import 'package:duolingo/src/widgets/login_text_field.dart';
import 'package:flutter/material.dart';

class LoginApp extends StatelessWidget {
  final _controllerLogin = TextEditingController();
  final _controllerPassword = TextEditingController();

  _body(context){
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 80, left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Insira seus dados', style:
              TextStyle(color: Colors.grey.shade400, fontSize: 23, fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),

              LoginTextField(context, 'Usuário ou email', controller: _controllerLogin, ),
              LoginTextField(context, 'Senha', controller: _controllerPassword, obscure: true,),

              SizedBox(height: 20,),
              _button('ENTRAR', color: Color(0xFF1AB1F6), colorText: Colors.white,
              widget:350, onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              }),
              SizedBox(height: 38,),
              Text('ESQUECI A SENHA', style:
              TextStyle(color: Colors.lightBlueAccent, fontSize: 23, fontWeight: FontWeight.bold),),
              Flexible(child: FractionallySizedBox(heightFactor: 0.8,),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _button('FACEBOOK', color: Colors.white, widget: 164  ,
                  colorText: Color(0xFF41608C), onPressed: (){}),
                  SizedBox(width: 18,),
                  _button('GOOGLE', color: Colors.white, widget: 164,
                  colorText: Color(0xFF4f4f4d), onPressed: (){}),
              ],
              ),
              SizedBox(height: 12),
              Container(
                margin: const EdgeInsets.all(8),
                child: const Text.rich(
                TextSpan(
                  text: 'Ao entrar no Duolingo, você concorda com os nossos',
                  style: TextStyle(fontSize: 18, color: Color(0xFFb2b2b0),),
                  children: <TextSpan>[
                    TextSpan(text: ' Termos e ', style: TextStyle(color: Color(0xFFa5a5a3),
                    fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Política de Privacidade',
                    style: TextStyle(color: Color(0xFFa5a5a3), fontWeight: FontWeight.bold)),
                  ],
                ),
),
              )
            ],
        ),
      ),
    );
  }
  _button(String text, {Color color, Color colorText, Function onPressed, double widget}){
    return Container(
      width: widget,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
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
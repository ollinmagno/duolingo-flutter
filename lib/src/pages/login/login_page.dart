import 'package:duolingo/src/api_firebase/api_response.dart';
import 'package:duolingo/src/firebase/firebase_service.dart';
import 'package:duolingo/src/pages/main_screen/home_screen.dart';
import 'package:duolingo/src/widgets/button.dart';
import 'package:duolingo/src/widgets/login_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _controllerLogin = TextEditingController();
    final _controllerPassword = TextEditingController();

  @override
  initState(){
    super.initState();
  }
  @override
  void dispose() {
    _controllerLogin.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }
    _onClickGoogle() async {
      final service = FirebaseService();
      ApiResponse response = await service.loginGoogle();

      if (response.ok) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        AlertDialog(
          title: Text("TESTE"),
          content: Text("TESTE"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    }

    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return Form(
            key: _formKey,
            child: Container(
              color: Colors.white,
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              padding: const EdgeInsets.only(
                  top: 60, left: 16.0, right: 16.0, bottom: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Insira seus dados',
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    LoginTextField(
                      context,
                      'Usuário ou email',
                      controller: _controllerLogin,
                    ),
                    LoginTextField(
                      context,
                      'Senha',
                      controller: _controllerPassword,
                      obscure: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Button(
                      'ENTRAR',
                      color: Color(0xFF1AB1F6),
                      colorText: Colors.white,
                      widget: 350,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      child: Text(
                        'ESQUECI A SENHA',
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(height: (constraints.maxHeight) / 3.5),
                    Container(
                        margin: const EdgeInsets.all(16.0),
                        height: 60,
                        width: constraints.maxWidth,
                        child: RaisedButton(
                          color: Colors.grey.shade100,
                          child: Text('Sign in with Google'),
                          onPressed: _onClickGoogle,
                        )),
                    SizedBox(height: 12),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: const Text.rich(
                        TextSpan(
                          text:
                              'Ao entrar no Duolingo, você concorda com os nossos',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFb2b2b0),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Termos e ',
                                style: TextStyle(
                                    color: Color(0xFFa5a5a3),
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: 'Política de Privacidade',
                                style: TextStyle(
                                    color: Color(0xFFa5a5a3),
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

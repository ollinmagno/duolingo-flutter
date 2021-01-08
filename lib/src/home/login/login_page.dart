import 'package:duolingo/src/components/button.dart';
import 'package:duolingo/src/components/login_text_field.dart';
import 'package:duolingo/src/firebase/api_response.dart';
import 'package:duolingo/src/firebase/firebase_service.dart';
import 'package:duolingo/src/home/main_screen/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerLogin = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future _onClickGoogle() async {
      final FirebaseService service = FirebaseService();
      ApiResponse response = await service.loginGoogle();

      if (response.ok) {
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    }

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, BoxConstraints constraints) =>
           Form(
            key: _formKey,
            child: Container(
              color: Colors.white,
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              padding: const EdgeInsets.only(
                  top: 60, left: 16, right: 16, bottom: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Insira seus dados",
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    LoginTextField(
                      context,
                      "Usuário ou email",
                      controller: _controllerLogin,
                    ),
                    LoginTextField(
                      context,
                      "Senha",
                      controller: _controllerPassword,
                      obscure: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Button(
                      "ENTRAR",
                      color: const Color(0xFF1AB1F6),
                      colorText: Colors.white,
                      widget: 350,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "ESQUECI A SENHA",
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: (constraints.maxHeight) / 3.5),
                    Container(
                        margin: const EdgeInsets.all(16),
                        height: 60,
                        width: constraints.maxWidth,
                        child: RaisedButton(
                          color: Colors.grey.shade100,
                          onPressed: _onClickGoogle,
                          child: const Text("Sign in with Google"),
                        )),
                    const SizedBox(height: 12),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: const Text.rich(
                        TextSpan(
                          text:
                          "Ao entrar no Duolingo, você concorda com os nossos",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFb2b2b0),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: " Termos e ",
                                style: TextStyle(
                                    color: Color(0xFFa5a5a3),
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "Política de Privacidade",
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
          ),
      ),
    );
  }
}

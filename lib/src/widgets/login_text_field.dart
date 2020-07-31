import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  String hintText;
  BuildContext context;
  TextEditingController controller;
  bool obscure;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  int maxLength;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;

  LoginTextField(this.context, this.hintText,
      {this.controller,
        this.obscure = false,
        this.validator,
        this.keyboardType,
        this.maxLength,
        this.textInputAction,
        this.focusNode,
        this.nextFocus,
      });
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboardType,
          maxLength: maxLength,
          style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            hintText: hintText,
            contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
    );
  }
}
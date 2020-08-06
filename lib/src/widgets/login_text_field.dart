import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final BuildContext context;
  final TextEditingController controller;
  final bool obscure;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final int maxLength;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FocusNode nextFocus;

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
        child: TextFormField(
          controller: controller,
          obscureText: obscure,
          validator: validator,
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
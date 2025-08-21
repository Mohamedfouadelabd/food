
import 'package:flutter/material.dart';

import '../Theme/my_Theme.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.validator,
      required this.controller,
      required this.keyboardType,
      this.isPassword = false,
      required this.label
      });

  String? Function(String?) validator;
  TextEditingController controller;
  TextInputType keyboardType;
  bool isPassword;
  String  label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        style: TextStyle(
          color: MyTheme.black,
          fontSize: 18,
        ),
        cursorColor: MyTheme.primary,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
          floatingLabelStyle: TextStyle(
            fontSize: 20,
            color: MyTheme.primary,
            fontWeight: FontWeight.bold,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: MyTheme.primary,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: MyTheme.primary,
              width: 2,
            ),
          ),
        ),
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword,
      ),
    );


  }
}

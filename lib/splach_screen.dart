

import 'dart:async';


import 'package:flutter/material.dart';
import 'package:food_app/Auth/Register/register.dart';
import 'package:food_app/MainScreen/main_screen.dart';

class SplachScreen extends StatelessWidget {
  static const String routeName='splach';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) =>  MainScreen()),
        );
      });
    });
    return Scaffold(
      body: Image.asset('assets/images/img.png',
      width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,

      ),

    );
  }
}

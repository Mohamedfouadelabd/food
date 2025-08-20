

import 'package:flutter/material.dart';

class MyTheme{
  static const primary=Color(0xffEF2A39);
  static const white=Color(0xffFFFFFF);
  static const black=Color(0xff000000);
static ThemeData primaryTheme=ThemeData(

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
        elevation: 0,
 titleTextStyle:TextStyle(
     color: MyTheme.black,
     fontSize: 22,
     fontWeight: FontWeight.bold
 ),
  ),
textTheme: TextTheme(
  titleSmall: TextStyle(
    color: MyTheme.black,
    fontSize: 14,
fontWeight: FontWeight.w500
  ),
titleMedium: TextStyle(
    color: MyTheme.black,
    fontSize: 18,
    fontWeight: FontWeight.bold
),
titleLarge: TextStyle(
    color: MyTheme.black,
    fontSize: 22,
    fontWeight: FontWeight.bold
),
)

);

}
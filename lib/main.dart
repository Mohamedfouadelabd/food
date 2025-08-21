import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:food_app/Auth/login/login_screen.dart';
import 'package:food_app/MainScreen/main_screen.dart';
import 'package:food_app/Theme/my_Theme.dart';
import 'package:food_app/splach_screen.dart';

import 'Auth/Register/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: MyTheme.primaryTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: SplachScreen.routeName,
            routes: {
              SplachScreen.routeName: (context) => SplachScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              MainScreen.routeName: (context) => MainScreen(),
            },
          );
        });
  }
}

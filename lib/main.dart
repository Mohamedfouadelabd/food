import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:food_app/Auth/login/login_screen.dart';
import 'package:food_app/HomeScreen/Random/more_detils_random.dart';
import 'package:food_app/MainScreen/main_screen.dart';
import 'package:food_app/Theme/my_Theme.dart';
import 'package:food_app/splach_screen.dart';

import 'Auth/Register/register_screen.dart';
import 'HomeScreen/Category/category_more_detils.dart';
import 'SearchTap/search_tap_detils.dart';

import 'package:food_app/FavoriteScreen/Add/Cubit/add_view_model.dart';
import 'package:food_app/FavoriteScreen/Add/domain/use_case.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => AddViewModel(injectAddUseCase()),
          child: MaterialApp(
            theme: MyTheme.primaryTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: MainScreen.routeName,
            routes: {
              SearchTapDetils.routeName: (context) => SearchTapDetils(),
              SplachScreen.routeName: (context) => SplachScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              MainScreen.routeName: (context) => MainScreen(),
              MoreDetilsRandom.routeName: (context) => MoreDetilsRandom(),
              CategoryMoreDetils.routeName: (context) => CategoryMoreDetils(),
            },
          ),
        );
      },
    );
  }
}

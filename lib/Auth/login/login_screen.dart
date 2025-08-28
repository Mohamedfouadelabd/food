import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/MainScreen/main_screen.dart';


import '../../Theme/my_theme.dart';
import '../../dailog _utils/Dailog_Utils.dart';

import '../custom_text_field.dart';
import 'Cubit/login_view_model.dart';
import 'Cubit/state.dart';
import 'domain/use_case.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenViewModel viewModel = LoginScreenViewModel(injectLoginUseCase());
  @override
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel, LoginState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DailogUtils.showLoading(context, state.loadingMassage ?? "waiting");
        } else if (state is LoginErrorState) {
          DailogUtils.hideLoading(context);
          DailogUtils.showMassage(
            context,
            state.errorMassage ?? "error",
            posActionName: 'ok',
          );
        } else if (state is LoginSuccessState) {
          DailogUtils.hideLoading(context);
          DailogUtils.showMassage(
            context,
            state.myUser?.name ?? "",
            titel: 'success',
            posActionName: 'OK',
            posAc: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => MainScreen()),
              );
            },
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Image.asset('assets/images/img_5.png'),
                  Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.12,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Welcome back!',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: MyTheme.black),
                            ),
                          ),
                          CustomTextField(
                            controller: viewModel.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please Enter Email';
                              }
                              bool emailValid = RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                              ).hasMatch(text);
                              if (!emailValid) {
                                return 'Enter valid email';
                              }
                              return null;
                            },
                            label: 'Email',
                          ),
                          CustomTextField(
                            isPassword: true,
                            controller: viewModel.passwordController,
                            keyboardType: TextInputType.number,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please Enter Password';
                              }
                              if (text.length < 6) {
                                return 'Password must be greater than 6 chars';
                              }
                              return null;
                            },
                            label: 'Password',
                          ),
                        ],
                      )),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(MyTheme.primary),
                          ),
                          onPressed: () {
                            viewModel.login();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Login',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: MyTheme.white,
                                    ),
                              ),
                              Icon(
                                Icons.arrow_circle_right_rounded,
                                size: 30,
                              )
                            ],
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../HomeScreen/home_screen.dart';
import '../../MainScreen/main_screen.dart';
import '../../Theme/my_Theme.dart';
import '../../dailog _utils/Dailog_Utils.dart';
import '../custom_text_field.dart';
import '../login/login_screen.dart';
import 'Cubit/register_view_model.dart';
import 'Cubit/state.dart';
import 'Domain/use_case.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register_screen';

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterViewModel viewModel = RegisterViewModel(injectRegisterUseCase());
@override
  void initState() {
    // TODO: implement initState
    viewModel.register();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel ,RegisterState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DailogUtils.showLoading(context, state.loadingMassage ?? "waiting");
        } else if (state is RegisterErrorState) {
          DailogUtils.hideLoading(context);
          DailogUtils.showMassage(
            context,
            state.errorMassage ?? "error",
            posActionName: 'ok',
          );
        } else if (state is RegisterSuccessState) {
          DailogUtils.hideLoading(context);
          DailogUtils.showMassage(
            context,
            state.myUser?.name??"",
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                 Image.asset('assets/images/img_5.png'),


                  Form(
                    key: viewModel.formKey,
                    child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Create An Acount',
                          style: Theme.of(context).textTheme.titleLarge,

                          ),
                        ),

                        CustomTextField(
                          controller: viewModel.nameController,
                          keyboardType: TextInputType.name,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please Enter Name';
                            }
                            return null;
                          },
                          label: 'Name',
                        ),
                        CustomTextField(
                          controller: viewModel.emaillController,
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
                        CustomTextField(
                          isPassword: true,
                          controller: viewModel.conformationPassController,
                          keyboardType: TextInputType.number,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please Enter Confirmation Password';
                            }
                            if (text != viewModel.passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          label: 'Confirmation Password',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(MyTheme.primary),
                      ),
                      onPressed: () {
                        viewModel.register();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Signin',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: MyTheme.white
                            ),
                          ),
                          const Icon(
                            Icons.arrow_circle_right_rounded,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    child: Text(
                      'Already Have an account',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: MyTheme.primary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

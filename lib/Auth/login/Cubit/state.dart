

import '../../../Firebase/Model/my_user.dart';

abstract class LoginState {}

class LoginLoadingState extends LoginState {
  String? loadingMassage;
  LoginLoadingState({required this.loadingMassage});
}

class LoginErrorState extends LoginState {
  String? errorMassage;
  LoginErrorState({required this.errorMassage, });
}

class LoginSuccessState extends LoginState {
  MyUser? myUser;
  LoginSuccessState({required this.myUser});
}

class LoginInitialState extends LoginState {}

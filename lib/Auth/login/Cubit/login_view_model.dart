
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Auth/login/Cubit/state.dart';

import '../../../Firebase/Model/my_user.dart';
import '../../../Firebase/fire_base_utils.dart';
import '../domain/use_case.dart';

class LoginScreenViewModel extends Cubit<LoginState> {
  final LoginUseCase useCase;
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginScreenViewModel(this.useCase) : super(LoginInitialState());

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState(loadingMassage: "Logging in..."));

      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        MyUser? myUser =
        await FireBseUtils.getApiInstance().readUser(credential.user!.uid);

        if (myUser != null) {
          emit(LoginSuccessState(myUser: myUser));
        } else {
          emit(LoginErrorState(errorMassage: "User data not found in Firestore"));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(LoginErrorState(errorMassage: "No user found for that email."));
        } else if (e.code == 'wrong-password') {
          emit(LoginErrorState(errorMassage: "Wrong password provided."));
        } else {
          emit(LoginErrorState(errorMassage: e.message ?? "Login failed."));
        }
      } catch (e) {
        emit(LoginErrorState(errorMassage: e.toString()));
      }
    }
  }
}

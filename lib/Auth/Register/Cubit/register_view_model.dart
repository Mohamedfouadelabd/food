
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Auth/Register/Cubit/state.dart';

import '../../../Firebase/Model/my_user.dart';
import '../Domain/use_case.dart';

class RegisterViewModel extends Cubit<RegisterState> {
  RegisterUseCase useCase;
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var emaillController = TextEditingController();
  var conformationPassController = TextEditingController();

  RegisterViewModel(this.useCase) : super(RegisterInitialState());

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState(loadingMassage: 'Loading..'));
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emaillController.text,
          password: passwordController.text,
        );

        MyUser myUser = MyUser(
          name: nameController.text,
          id: credential.user?.uid ?? '',
          email: emaillController.text,
        );

        await useCase.invoke(myUser);

        emit(RegisterSuccessState(myUser: myUser));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(RegisterErrorState(
              errorMassage: 'The password provided is too weak.'));
        } else if (e.code == 'email-already-in-use') {
          emit(RegisterErrorState(
              errorMassage: 'The account already exists for that email.'));
        } else {
          emit(RegisterErrorState(errorMassage: e.message ?? 'Auth Error'));
        }
      } catch (e) {
        emit(RegisterErrorState(errorMassage: e.toString()));
      }
    }
  }
}

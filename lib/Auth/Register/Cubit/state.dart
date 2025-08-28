
import '../../../Firebase/Model/my_user.dart';

abstract class RegisterState{}
class RegisterLoadingState extends RegisterState{
  String ?loadingMassage;
  RegisterLoadingState({ required this.loadingMassage});
}
class RegisterErrorState extends RegisterState{
  String ?errorMassage;
  RegisterErrorState({required this.errorMassage});
}
class RegisterSuccessState extends RegisterState{
MyUser ?myUser ;
RegisterSuccessState({required this.myUser});

}
class RegisterInitialState extends RegisterState{

}
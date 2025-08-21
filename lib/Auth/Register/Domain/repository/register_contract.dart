import '../../../../Firebase/Model/my_user.dart';

abstract class RegisterContract{
 Future<void> register(MyUser myUser);


}
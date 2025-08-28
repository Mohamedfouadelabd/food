import '../../../../Firebase/Model/my_user.dart';

abstract class RegisterRemoteDataSource{
  Future<void> register(MyUser myUser);

}
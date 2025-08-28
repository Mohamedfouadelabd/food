
import 'package:food_app/Auth/Register/Domain/repository/register_contract.dart';

import '../../../Firebase/Model/my_user.dart';
import '../Repository/register_impl.dart';

class RegisterUseCase {
  final RegisterContract registerContract;

  RegisterUseCase({required this.registerContract});

  Future<void> invoke(MyUser myUser) async {
    return await registerContract.register(myUser);
  }
}
RegisterUseCase   injectRegisterUseCase(){
 return  RegisterUseCase(registerContract: injectRegisterContract());
}




import '../../../Firebase/Model/my_user.dart';
import '../../../Firebase/fire_base_utils.dart';
import '../Domain/repository/register_remote_data_source.dart';

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource{
 FireBseUtils fireBseUtils;
 RegisterRemoteDataSourceImpl({required this.fireBseUtils}) ;
 @override
  Future<void> register(MyUser myUser) {
    var response=fireBseUtils.addUser(myUser);
 return response;
  }


}

RegisterRemoteDataSource injectRegisterRemoteDataSource(){
 return RegisterRemoteDataSourceImpl(fireBseUtils: FireBseUtils.getApiInstance());


}
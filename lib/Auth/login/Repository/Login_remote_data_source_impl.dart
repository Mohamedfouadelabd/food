

import '../../../Firebase/fire_base_utils.dart';
import '../domain/repository/login_remote_data_source.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource{
 FireBseUtils fireBseUtils;
 LoginRemoteDataSourceImpl({required this.fireBseUtils});
 @override
  Future<void> login(String uId) {
var response=  fireBseUtils.readUser(uId);
 return response;
 }

}


LoginRemoteDataSource injectLoginRemoteDataSource(){
  return LoginRemoteDataSourceImpl(fireBseUtils: FireBseUtils.getFirebaseInstance());


}
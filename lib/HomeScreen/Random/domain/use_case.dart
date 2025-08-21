import 'package:food_app/HomeScreen/Random/Repository/random_repository_impl.dart';
import 'package:food_app/HomeScreen/Random/domain/repository/random_repository_contract.dart';
import 'package:food_app/model/RandomSourceResponse.dart';

class RandomUseCase{
  RandomRepositoryContract repositoryContract;
  RandomUseCase({required this.repositoryContract});

Future <RandomSourceResponse?>invoke(){
  return repositoryContract.getAllRandomCategory();

}

}
RandomUseCase injectRandomUseCase(){

  return RandomUseCase(repositoryContract: injectRandomRepositoryContract());
}
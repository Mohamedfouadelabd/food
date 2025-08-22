import 'package:food_app/model/RandomSourceResponse.dart';

abstract class RandomState{}
class RandomLoadingState extends RandomState{}
class RandomErrorState extends RandomState{
  String? errorMassage;
  RandomErrorState({required this.errorMassage});
}
class RandomSucssesState extends RandomState{
  RandomSourceResponse ?response;
  RandomSucssesState({required this.response });
}
import '../../../../model/CountryMealSourceResponse.dart';

abstract class FoodRemoteDataSource{

  Future<CountryMealSourceResponse?> getFoodByCountry(String area);

}
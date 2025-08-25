import '../../../../model/CountryMealSourceResponse.dart';

abstract class FoodRepositoryContract{

  Future<CountryMealSourceResponse?> getFoodByCountry(String area);

}
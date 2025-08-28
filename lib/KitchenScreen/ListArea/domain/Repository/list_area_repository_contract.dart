import '../../../../model/CountrySourceResponse.dart';

abstract class ListAreaRepositoryContract{
  Future<CountrySourceResponse?> getCountry();

}
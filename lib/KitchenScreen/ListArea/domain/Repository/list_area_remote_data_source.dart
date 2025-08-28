import '../../../../model/CountrySourceResponse.dart';

abstract class ListAreaRemoteDataSource{
  Future<CountrySourceResponse?> getCountry();
}
import '../../../model/CountrySourceResponse.dart';

abstract class ListAreaState{}
class ListLoadingAreaState extends  ListAreaState{}
class ListErrorAreaState  extends  ListAreaState{
  String ?errorMassage;
  ListErrorAreaState({required this.errorMassage});
}
class ListSucssesAreaState extends  ListAreaState{
  CountrySourceResponse ?response;
  ListSucssesAreaState({required this.response});
}
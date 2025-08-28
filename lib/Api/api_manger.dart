import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:food_app/Api/api_const.dart';
import 'package:food_app/model/RandomSourceResponse.dart';
import 'package:food_app/model/SearchSourceResponse.dart';
import 'package:http/http.dart' as http;

import '../model/AllCategorySourceResponse.dart';
import '../model/CountryMealSourceResponse.dart';
import '../model/CountrySourceResponse.dart';
import '../model/FoodCategoryDetilsSourceResponse.dart';
import '../model/FoodCategorySourceResponse.dart';

class ApiManger {
  ApiManger._();
  static ApiManger? _instance;
  static ApiManger getApiInstance() {
    _instance ??= ApiManger._();
    return _instance!;
  }

  Future<RandomSourceResponse?> getAllRandomCategory() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.randomCategory);
      /*
https://www.themealdb.com/api/json/v1/1/random.php

     */
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return RandomSourceResponse.fromJson(json);
    } else {
      print('No internet connection');
      return null;
    }
  }

  Future<AllCategorySourceResponse?> getCategory() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      /*
    https://www.themealdb.com/api/json/v1/1/categories.php
     */
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.allCategory);
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return AllCategorySourceResponse.fromJson(json);
    } else {
      print('No internet connection');
      return null;
    }
  }

  Future<FoodCategorySourceResponse?> getFoodCategory() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.foodCategory,{
        'c': 'list'
      });
      /*
    https://www.themealdb.com/api/json/v1/1/list.php?c=list
     */
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return FoodCategorySourceResponse.fromJson(json);
    } else {
      print('No internet connection');
      return null;
    }
  }

  Future<FoodCategoryDetilsSourceResponse?> getFoodByCategory(
      String ingredient) async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.foodByCategory, {
        'i': ingredient,
      });

      try {
        var response = await http.get(url);

        if (response.statusCode == 200) {
          var json = jsonDecode(response.body);
          return FoodCategoryDetilsSourceResponse.fromJson(json);
        } else {
          print('HTTP error: ${response.statusCode}');
          return null;
        }
      } catch (e) {
        print('Error decoding JSON: $e');
        return null;
      }
    } else {
      print('No internet connection');
      return null;
    }
  }


  Future<CountrySourceResponse?> getCountry() async {
    /*
    https://www.themealdb.com/api/json/v1/1/list.php?a=list
     */
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.country,{

        'a':'list'
      });
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CountrySourceResponse.fromJson(json);
    } else {
      print('No internet connection');
      return null;
    }
  }

  Future<CountryMealSourceResponse?> getFoodByCountry(String area) async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      /*
https://www.themealdb.com/api/json/v1/1/filter.php?a=American

   */
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.foodByCountry, {
        'a': area,
      });
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CountryMealSourceResponse.fromJson(json);
    } else {
      print('No internet connection');
      return null;
    }
  }

  Future<SearchSourceResponse?> getSearch(String mealName)async{
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url=Uri.https(ApiConst.baseUrl,ApiConst.search,{

        's':mealName,
      });
      /*

   https://www.themealdb.com/api/json/v1/1/search.php?s=pizza
    */


      var response= await http.get(url);
      var bodyString=response.body;
      var json=jsonDecode(bodyString);
      return SearchSourceResponse.fromJson(json);

    }else {
      print('No internet connection');
      return null;
    }










}

}

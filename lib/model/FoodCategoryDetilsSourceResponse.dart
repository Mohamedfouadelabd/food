/// meals : [{"strMeal":"Brown Stew Chicken","strMealThumb":"https://www.themealdb.com/images/media/meals/sypxpx1515365095.jpg","idMeal":"52940"},{"strMeal":"Chicken & mushroom Hotpot","strMealThumb":"https://www.themealdb.com/images/media/meals/uuuspp1511297945.jpg","idMeal":"52846"},{"strMeal":"Chicken Alfredo Primavera","strMealThumb":"https://www.themealdb.com/images/media/meals/syqypv1486981727.jpg","idMeal":"52796"},{"strMeal":"Chicken Basquaise","strMealThumb":"https://www.themealdb.com/images/media/meals/wruvqv1511880994.jpg","idMeal":"52934"},{"strMeal":"Chicken Congee","strMealThumb":"https://www.themealdb.com/images/media/meals/1529446352.jpg","idMeal":"52956"},{"strMeal":"Chicken Handi","strMealThumb":"https://www.themealdb.com/images/media/meals/wyxwsp1486979827.jpg","idMeal":"52795"},{"strMeal":"Chicken Karaage","strMealThumb":"https://www.themealdb.com/images/media/meals/tyywsw1505930373.jpg","idMeal":"52831"},{"strMeal":"Kentucky Fried Chicken","strMealThumb":"https://www.themealdb.com/images/media/meals/xqusqy1487348868.jpg","idMeal":"52813"},{"strMeal":"Kung Pao Chicken","strMealThumb":"https://www.themealdb.com/images/media/meals/1525872624.jpg","idMeal":"52945"},{"strMeal":"Pad See Ew","strMealThumb":"https://www.themealdb.com/images/media/meals/uuuspp1468263334.jpg","idMeal":"52774"},{"strMeal":"Piri-piri chicken and slaw","strMealThumb":"https://www.themealdb.com/images/media/meals/hglsbl1614346998.jpg","idMeal":"53039"},{"strMeal":"Thai Green Curry","strMealThumb":"https://www.themealdb.com/images/media/meals/sstssx1487349585.jpg","idMeal":"52814"}]

class FoodCategoryDetilsSourceResponse {
  FoodCategoryDetilsSourceResponse({
      this.meals,});

  FoodCategoryDetilsSourceResponse.fromJson(dynamic json) {
    if (json['meals'] != null) {
      meals = [];
      json['meals'].forEach((v) {
        meals?.add(Source.fromJson(v));
      });
    }
  }
  List<Source>? meals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (meals != null) {
      map['meals'] = meals?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// strMeal : "Brown Stew Chicken"
/// strMealThumb : "https://www.themealdb.com/images/media/meals/sypxpx1515365095.jpg"
/// idMeal : "52940"

class Source {
  Source({
      this.strMeal, 
      this.strMealThumb, 
      this.idMeal,});

  Source.fromJson(dynamic json) {
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    idMeal = json['idMeal'];
  }
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['strMeal'] = strMeal;
    map['strMealThumb'] = strMealThumb;
    map['idMeal'] = idMeal;
    return map;
  }

}
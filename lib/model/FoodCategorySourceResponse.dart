/// meals : [{"strCategory":"Beef"},{"strCategory":"Breakfast"},{"strCategory":"Chicken"},{"strCategory":"Dessert"},{"strCategory":"Goat"},{"strCategory":"Lamb"},{"strCategory":"Miscellaneous"},{"strCategory":"Pasta"},{"strCategory":"Pork"},{"strCategory":"Seafood"},{"strCategory":"Side"},{"strCategory":"Starter"},{"strCategory":"Vegan"},{"strCategory":"Vegetarian"}]

class FoodCategorySourceResponse {
  FoodCategorySourceResponse({
      this.meals,});

  FoodCategorySourceResponse.fromJson(dynamic json) {
    if (json['meals'] != null) {
      meals = [];
      json['meals'].forEach((v) {
        meals?.add(Meals.fromJson(v));
      });
    }
  }
  List<Meals>? meals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (meals != null) {
      map['meals'] = meals?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// strCategory : "Beef"

class Meals {
  Meals({
      this.strCategory,});

  Meals.fromJson(dynamic json) {
    strCategory = json['strCategory'];
  }
  String? strCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['strCategory'] = strCategory;
    return map;
  }

}
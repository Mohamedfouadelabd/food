/// meals : [{"strArea":"American"},{"strArea":"British"},{"strArea":"Canadian"},{"strArea":"Chinese"},{"strArea":"Croatian"},{"strArea":"Dutch"},{"strArea":"Egyptian"},{"strArea":"Filipino"},{"strArea":"French"},{"strArea":"Greek"},{"strArea":"Indian"},{"strArea":"Irish"},{"strArea":"Italian"},{"strArea":"Jamaican"},{"strArea":"Japanese"},{"strArea":"Kenyan"},{"strArea":"Malaysian"},{"strArea":"Mexican"},{"strArea":"Moroccan"},{"strArea":"Polish"},{"strArea":"Portuguese"},{"strArea":"Russian"},{"strArea":"Spanish"},{"strArea":"Thai"},{"strArea":"Tunisian"},{"strArea":"Turkish"},{"strArea":"Ukrainian"},{"strArea":"Unknown"},{"strArea":"Uruguayan"},{"strArea":"Vietnamese"}]

class CountrySourceResponse {
  CountrySourceResponse({
      this.meals,});

  CountrySourceResponse.fromJson(dynamic json) {
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

/// strArea : "American"

class Meals {
  Meals({
      this.strArea,});

  Meals.fromJson(dynamic json) {
    strArea = json['strArea'];
  }
  String? strArea;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['strArea'] = strArea;
    return map;
  }

}
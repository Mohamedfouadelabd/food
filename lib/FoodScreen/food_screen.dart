
import 'package:flutter/material.dart';

import 'DetilsListFood/detils_list_food_Item.dart';
import 'Listfood/Cubit/list_food_view.dart';
import 'Listfood/list_food_tap_bar.dart';

class FoodScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
       SizedBox(
         height: MediaQuery.of(context).size.height*0.02,
       ),
         ListFoodView(),
         SizedBox(
           height: MediaQuery.of(context).size.height*0.02,
         ),

       ],
    );
  }
}

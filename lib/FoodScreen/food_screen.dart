
import 'package:flutter/material.dart';

import 'DetilsListFood/detils_list_food_Item.dart';
import 'Listfood/list_food_tap_bar.dart';

class FoodScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
       SizedBox(
         height: MediaQuery.of(context).size.height*0.02,
       ),
         ListFoodTapBar(),
         SizedBox(
           height: MediaQuery.of(context).size.height*0.02,
         ),
        Expanded(child: ListView.builder(
            itemCount: 100,
          itemBuilder:(context, index) {
            return  DetilsListFoodItem();
            },

        ))
       ],
    );
  }
}

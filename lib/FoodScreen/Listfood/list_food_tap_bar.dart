
import 'package:flutter/material.dart';

import 'list_food_item.dart';

class ListFoodTapBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 8,

        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.transparent,
              isScrollable: true,

              tabs: [

              ListFoodItem(isSelected: true),
              ListFoodItem(isSelected: true),
      ListFoodItem(isSelected: true),
      ListFoodItem(isSelected: true),
      ListFoodItem(isSelected: true),
      ListFoodItem(isSelected: true),
      ListFoodItem(isSelected: true),
      ListFoodItem(isSelected: true),
      ],
    ),

  ]
    ),
    );
  }
}

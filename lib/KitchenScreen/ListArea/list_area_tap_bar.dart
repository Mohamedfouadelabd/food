
import 'package:flutter/material.dart';

import 'item_list_area.dart';

class ListAreaTapBar extends StatelessWidget {


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

                ItemListArea(isSelected: true),
                ItemListArea(isSelected: true),
                ItemListArea(isSelected: true),
                ItemListArea(isSelected: true),
                ItemListArea(isSelected: true),
                ItemListArea(isSelected: true),
                ItemListArea(isSelected: true),
                ItemListArea(isSelected: true),
              ],
            ),

          ]
      ),
    );
  }
}

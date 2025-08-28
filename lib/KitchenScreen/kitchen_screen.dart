import 'package:flutter/material.dart';

import 'Food/food_detils_item.dart';
import 'ListArea/Cubit/list_area_view.dart';
import 'ListArea/list_area_tap_bar.dart';

class KitchenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        ListAreaView(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),

      ],
    );
  }
}

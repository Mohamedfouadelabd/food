
import 'package:flutter/material.dart';

import 'favorite_screen_item.dart';

class FavoriteScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
       Expanded(
         child: ListView.builder(
          itemCount: 20,
           itemBuilder: (context, index) {
           return  FavoriteScreenItem();
         },),
       ),
      ],

    );
  }
}

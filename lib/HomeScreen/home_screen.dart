
import 'package:flutter/material.dart';
import 'package:food_app/Theme/my_Theme.dart';

import 'Category/Cubit/category_view.dart';
import 'Category/category_item.dart';
import 'Random/Cubit/random_view.dart';
import 'Random/random_item.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Dishes of the day',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: MyTheme.primary
          ),
          ),
        ),
        Expanded(child: RandomView()),

       SizedBox(
         height: MediaQuery.of(context).size.height*0.012,
       ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('The most common',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: MyTheme.primary
            ),
          ),
        ),
        Expanded(child: CategoryView()),
      ],

    );
  }
}

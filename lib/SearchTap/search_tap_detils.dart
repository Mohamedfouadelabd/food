
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HomeScreen/custom_Text.dart';
import '../Theme/my_Theme.dart';
import '../model/SearchSourceResponse.dart';

class SearchTapDetils extends StatelessWidget {
static const String routeName='search_tap';

  @override
  Widget build(BuildContext context) {
 var args=ModalRoute.of(context)!.settings.arguments as Meals;
 List<String?> ingredients = [
   args.strIngredient1,
   args.strIngredient2,
   args.strIngredient3,
   args.strIngredient4,
   args.strIngredient5,
   args.strIngredient6,
   args.strIngredient7,
   args.strIngredient8,
   args.strIngredient9,
   args.strIngredient10,
   args.strIngredient11,
   args.strIngredient12,
   args.strIngredient13,
   args.strIngredient14,
   args.strIngredient15,
   args.strIngredient16,
   args.strIngredient17,
   args.strIngredient18,
   args.strIngredient19,
   args.strIngredient20,
 ];
 return Scaffold(
     appBar: AppBar(
       title: Text('More detils..'),

    

     ),
  body: SingleChildScrollView(
    child: Column(
      children: [
        Container(
        
         clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10)
          ),
          child: CachedNetworkImage(
           fit: BoxFit.cover,
            imageUrl: args.strMealThumb??"",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Dish ingredients',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: MyTheme.primary,
            ),
          ),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ingredients.asMap().entries.map((entry) {
            int index = entry.key + 1;
            String? ingredient = entry.value;

            if (ingredient == null || ingredient.isEmpty) {
              return SizedBox.shrink();
            }

            return Row(
              children: [
                Text(
                  "$index. ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: CustomText(titel: ingredient),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    ),
  ),
   );
  }
}

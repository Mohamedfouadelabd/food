import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Theme/my_Theme.dart';
import '../../model/FoodCategoryDetilsSourceResponse.dart';

class DetilsListFoodItem extends StatelessWidget {
  Source source;
  DetilsListFoodItem({required this.source});
  @override
  Widget build(BuildContext context) {
    return Container(
     clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(5),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
         border: Border.all(
            color: MyTheme.black,
                width: 2,
         ),
           borderRadius: BorderRadius.circular(10)),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            height: MediaQuery.of(context).size.height * 0.31,
            width: double.infinity,
           fit: BoxFit.cover,
            imageUrl: source.strMealThumb ?? "",
            placeholder: (context, url) => CircularProgressIndicator(
              color: MyTheme.primary,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    source.strMeal ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: MyTheme.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Image.asset(
                    'assets/images/img_3.png',
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

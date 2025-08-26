

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/SearchTap/search_tap_detils.dart';

import '../Theme/my_Theme.dart';
import '../model/SearchSourceResponse.dart';

class SearchTapItem extends StatelessWidget {
  Meals meals;
  SearchTapItem({required this.meals});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(SearchTapDetils.routeName,
        arguments: meals

        );
      },
      child: Container(
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.all(4),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

          border: Border.all(color: MyTheme.black, width: 3),
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              height: MediaQuery.of(context).size.height * 0.1,
              imageUrl: meals.strMealThumb??"",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                       meals.strMeal??"",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: MyTheme.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                    meals.strArea??"",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: MyTheme.black),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

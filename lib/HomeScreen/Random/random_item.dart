import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/HomeScreen/Random/more_detils_random.dart';
import 'package:food_app/model/RandomSourceResponse.dart';

import '../../Theme/my_Theme.dart';

class RandomItem extends StatelessWidget {
  Meals meals;
  RandomItem({required this.meals});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(2),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            imageUrl: meals.strMealThumb ?? "",
            placeholder: (context, url) => Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                    strokeWidth: 4, color: MyTheme.primary),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              meals.strIngredient1 ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: MyTheme.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              meals.strIngredient3 ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: MyTheme.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  meals.strArea ?? "",
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
              ),
              InkWell(
               onTap: (){
                 Navigator.of(context).pushNamed(MoreDetilsRandom.routeName,
                 arguments:meals );

               },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                     "More Detils..",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: MyTheme.primary),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
/*
 Image.asset(
            'assets/images/img_4.png',

          ),
 */

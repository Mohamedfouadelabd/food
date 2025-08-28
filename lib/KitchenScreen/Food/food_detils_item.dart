

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/CountryMealSourceResponse.dart';

import '../../Theme/my_Theme.dart';

class FoodDetilsItem extends StatelessWidget {

Meals meals;
FoodDetilsItem({required this.meals});
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
           width: 2
         ),
          borderRadius: BorderRadius.circular(10)),


      child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            imageUrl:meals.strMealThumb??"",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(color: MyTheme.primary),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),



          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  meals.strMeal??"",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: MyTheme.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 20
                ),
                child: Image.asset('assets/images/img_3.png',
                  height: MediaQuery.of(context).size.height*0.03,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

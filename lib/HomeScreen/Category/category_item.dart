

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_app/Firebase/Model/My_Meal.dart';
import 'package:food_app/HomeScreen/Category/category_more_detils.dart';
import 'package:food_app/Theme/my_Theme.dart';

import '../../FavoriteScreen/Add/Cubit/add_view_model.dart';
import '../../model/AllCategorySourceResponse.dart';

class CategoryItem extends StatelessWidget {
  Categories categories;
  CategoryItem({required this.categories});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(CategoryMoreDetils.routeName,
        arguments:  categories,
        );
      },
      child: Container(
       padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height*0.2,
       width: MediaQuery.of(context).size.width*0.44,
        decoration: BoxDecoration(
borderRadius: BorderRadius.circular(5),
          border: Border.all(
  width: 2,
  color: MyTheme.black
),
        ),
        child:Column(

          children: [
            CachedNetworkImage(
              height: MediaQuery.of(context).size.height*0.18,
              imageUrl:categories.strCategoryThumb??"",
              placeholder: (context, url) => CircularProgressIndicator(
                color: MyTheme.primary,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text(
              (categories.strCategoryDescription ?? "")
                  .split("\n")
                  .first,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style :Theme.of(context)
                  .textTheme
                  .titleMedium!
          .copyWith(color: MyTheme.black),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    categories.strCategory??"",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: MyTheme.black),
                  ),
                ),
                InkWell(
                 onTap: (){

                   MyMeal myMeal = MyMeal(
                     id: categories.idCategory ,
                     title: categories.strCategory,
                     images: categories.strCategoryThumb,
                   );


                   context.read<AddViewModel>().addMeal(myMeal);
                 },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 5
                    ),
                    child: Image.asset('assets/images/img_3.png',
                      height: MediaQuery.of(context).size.height*0.03,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

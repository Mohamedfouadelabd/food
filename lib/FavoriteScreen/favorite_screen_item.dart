import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/FavoriteScreen/Add/Cubit/add_view_model.dart';
import 'package:food_app/Firebase/Model/My_Meal.dart';
import 'package:food_app/Theme/my_Theme.dart';

class FavoriteScreenItem extends StatelessWidget {
  MyMeal myMeal;
  FavoriteScreenItem({required this.myMeal});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            imageUrl: myMeal.images ?? "",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) =>
                Icon(Icons.image_not_supported),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  myMeal.title ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: MyTheme.black),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {

                      context.read<AddViewModel>().deleteMeal(myMeal.id!);
                    },
                    icon: Icon(Icons.delete, color: MyTheme.primary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

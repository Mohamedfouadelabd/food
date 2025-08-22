
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/FoodScreen/Listfood/Cubit/State.dart';
import 'package:food_app/FoodScreen/Listfood/domin/use_case.dart';
import 'package:food_app/Theme/my_Theme.dart';

import '../list_food_item.dart';
import '../list_food_tap_bar.dart';
import 'list_food_view_model.dart';

class ListFoodView extends StatefulWidget {
  @override
  State<ListFoodView> createState() => _ListFoodViewState();
}

class _ListFoodViewState extends State<ListFoodView> {
  ListFoodViewModel viewModel= ListFoodViewModel(injectListFoodUseCase());
@override
  void initState() {
    // TODO: implement initState
    viewModel.getFoodCategory();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListFoodViewModel,ListFoodState>(
      bloc: viewModel,
        builder:(context, state) {
        if(state is ListFoodLoadingState){
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primary,
            ),
          );

        }else if(state is ListFoodErrorState){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.errorMassage ?? "An error occurred"),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Try Again'),
                ),
              ],
            ),
          );

        }else if(state is ListFoodSuccessState){
var foodList=state.response?.meals??[];
return ListFoodTapBar(mealsList:foodList ,);
        }


          return Container();
          },
    );
  }
}

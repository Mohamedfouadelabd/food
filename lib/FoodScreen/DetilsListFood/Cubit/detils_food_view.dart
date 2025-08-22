import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/FoodScreen/DetilsListFood/Cubit/State.dart';
import 'package:food_app/Theme/my_Theme.dart';

import '../detils_list_food_Item.dart';
import '../domain/use_case.dart';
import 'detils_food_view_model.dart';

class DetilsFoodView extends StatefulWidget {
  String ingredient;
  DetilsFoodView({required this.ingredient});
  @override
  State<DetilsFoodView> createState() => _DetilsFoodViewState();
}

class _DetilsFoodViewState extends State<DetilsFoodView> {
  DetilsFoodViewModel viewModel =
      DetilsFoodViewModel(injectDetilsFoodUseCase());

  @override
  void initState() {
    // TODO: implement initState
    viewModel.getDetilsFood(widget.ingredient);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetilsFoodViewModel, DetilsFoodState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is DetilsFoodLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primary,
            ),
          );
        } else if (state is DetilsFoodErrorState) {
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
        } else if (state is DetilsFoodSucssesState) {
          var detilsFoodList = state.response?.meals ?? [];
         return
            ListView.builder(
            itemCount:  detilsFoodList.length,
              itemBuilder:(context, index) {
                return  DetilsListFoodItem(source:  detilsFoodList[index],);
              },


         );

        }

        return Container();
      },
    );
  }
}

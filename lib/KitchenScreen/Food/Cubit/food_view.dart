import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/KitchenScreen/Food/Cubit/state.dart';
import 'package:food_app/KitchenScreen/Food/domain/use_case.dart';
import 'package:food_app/Theme/my_Theme.dart';
import '../food_detils_item.dart';
import 'food_view_model.dart';

class FoodView extends StatefulWidget {
  String area;
  FoodView({required this.area});

  @override
  State<FoodView> createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> {
  FoodViewModel viewModel = FoodViewModel(injectFoodUseCase());
  @override
  void initState() {
    // TODO: implement initState
    viewModel.getFoodByCountry(widget.area);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodViewModel, FoodState>(
     bloc: viewModel,
      builder: (context, state) {
        if (state is FoodLoadingState) {
          return Center(
              child: CircularProgressIndicator(
            color: MyTheme.primary,
          ));
        } else if (state is FoodErrorState) {
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
        } else if (state is FoodSucssesState) {
          var foodList = state.response?.meals ?? [];
          return ListView.builder(
            itemCount: foodList.length,
            itemBuilder: (context, index) {
              return FoodDetilsItem(
                meals: foodList[index],
              );
            },
          );
        }

        return Container();
      },
    );
  }
}

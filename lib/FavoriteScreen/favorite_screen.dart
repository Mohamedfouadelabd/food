import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/FavoriteScreen/Add/Cubit/add_view_model.dart';
import 'package:food_app/FavoriteScreen/Add/Cubit/state.dart';
import 'package:food_app/FavoriteScreen/favorite_screen_item.dart';
import 'package:food_app/Theme/my_Theme.dart';
import 'package:food_app/FavoriteScreen/Add/domain/use_case.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddViewModel(injectAddUseCase()),
      child: BlocBuilder<AddViewModel, AddState>(
        builder: (context, state) {
          if (state is AddLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.primary,
              ),
            );
          } else if (state is AddErrorState) {
            return Center(child: Text("Something went wrong"));
          } else if (state is AddSucssesState) {
            if (state.meals.isEmpty) {
              return Center(child: Text("No favorites yet"));
            }
            return ListView.builder(
              itemCount: state.meals.length,
              itemBuilder: (context, index) {
                return FavoriteScreenItem(myMeal: state.meals[index]);
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/HomeScreen/Category/Cubit/State.dart';
import 'package:food_app/HomeScreen/Category/domain/use_case.dart';
import 'package:food_app/Theme/my_Theme.dart';

import '../category_item.dart';
import 'category_view_model.dart';

class CategoryView extends StatefulWidget {
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  CategoryViewModel viewModel = CategoryViewModel(injectCategoryUseCase());
  @override
  void initState() {
    // TODO: implement initState
    viewModel.getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
     bloc: viewModel,
      builder: (context, state) {
        if (state is CategoryLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primary,
            ),
          );
        } else if (state is CategoryErrorState) {
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
        } else if (state is CategorySucssesState) {
          var categoryList = state.response?.categories ?? [];
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return CategoryItem(
                categories: categoryList[index],
              );
            },
          );
        }

        return Container();
      },
    );
  }
}

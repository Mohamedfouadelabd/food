import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/SearchTap/Cubit/State.dart';
import 'package:food_app/SearchTap/Cubit/search_view_model.dart';
import 'package:food_app/SearchTap/domain/use_case.dart';
import 'package:food_app/Theme/my_Theme.dart';

import '../search_tap_item.dart';

class SearchView extends StatefulWidget {
  String Mealname;
  SearchView({required this.Mealname});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SearchViewModel viewModel = SearchViewModel(injectSearchUseCase());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSearch(widget.Mealname);
  }

  @override
  void didUpdateWidget(covariant SearchView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.Mealname != widget.Mealname) {
      viewModel.getSearch(widget.Mealname);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchViewModel, SearchState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primary,
            ),
          );
        } else if (state is SearchErrorState) {
          return Center(
            child: Text('Sorry, this meal is not available.'),
          );
        } else if (state is SearchSucssesState) {
          var searchList = state.response?.meals ?? [];
          return ListView.builder(
            itemCount: searchList.length,
            itemBuilder: (context, index) {
              return SearchTapItem(
                meals: searchList[index],
              );
            },
          );
        }

        return Container();
      },
    );
  }
}

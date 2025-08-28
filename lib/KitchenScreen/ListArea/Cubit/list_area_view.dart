

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/KitchenScreen/ListArea/Cubit/State.dart';
import 'package:food_app/KitchenScreen/ListArea/domain/use_case.dart';
import 'package:food_app/Theme/my_Theme.dart';

import '../list_area_tap_bar.dart';
import 'list_area_view_model.dart';

class ListAreaView extends StatefulWidget {
  @override
  State<ListAreaView> createState() => _ListAreaViewState();
}

class _ListAreaViewState extends State<ListAreaView> {
  ListAreaViewModel viewModel=ListAreaViewModel(injectListAreaUseCase());
@override
  void initState() {
    // TODO: implement initState
    viewModel.getCountry();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListAreaViewModel,ListAreaState>(
      bloc: viewModel,
      builder: (context, state) {
      if(state is ListLoadingAreaState){
        return Center(
          child: CircularProgressIndicator(
            color: MyTheme.primary,
          ),
        );
      }else if(state is ListErrorAreaState){
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
      }else if(state is ListSucssesAreaState){
        var listArea=state.response?.meals??[];
        return ListAreaTapBar(areaList: listArea,);
      }

        return Container();
    },);
  }
}

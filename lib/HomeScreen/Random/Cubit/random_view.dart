
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/HomeScreen/Random/Cubit/State.dart';
import 'package:food_app/HomeScreen/Random/Cubit/random_view_model.dart';
import 'package:food_app/HomeScreen/Random/domain/use_case.dart';

import '../../../Theme/my_Theme.dart';
import '../random_item.dart';

class RandomView  extends StatefulWidget {
  @override
  State<RandomView> createState() => _RandomViewState();
}

class _RandomViewState extends State<RandomView> {
  RandomViewModel viewModel =RandomViewModel(injectRandomUseCase());
@override
  void initState() {
    // TODO: implement initState
    viewModel.getAllRandomCategory();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<  RandomViewModel,RandomState>(
      bloc: viewModel,
      builder: (context, state) {
if(state is RandomLoadingState ){
  return Center(child: CircularProgressIndicator(color: MyTheme.primary,));

}else if(state is RandomErrorState){

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(state.errorMassage ?? "An error occurred"),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {


          },
          child: const Text('Try Again'),
        ),
      ],
    ),
  );
}else if(state is RandomSucssesState){
  var randomList=state.response?.meals??[];

return ListView.builder(
  itemCount: randomList.length,
  itemBuilder: (context, index) {
return RandomItem(meals: randomList[index],);
},);

}







  return Container();
          },

    );
  }
}

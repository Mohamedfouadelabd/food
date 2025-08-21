import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/HomeScreen/Random/Cubit/State.dart';

import '../domain/use_case.dart';

class RandomViewModel extends Cubit<RandomState>{
  RandomUseCase useCase;
  RandomViewModel(this.useCase):super(RandomLoadingState());

void getAllRandomCategory()async {
try{
  emit( RandomLoadingState());
  var response=await useCase.invoke();
  if(response?.meals==null){
    emit(RandomErrorState(errorMassage: 'Error'));

  }else{
    emit(RandomSucssesState(response: response));

  }

} catch(e) {
  emit(RandomErrorState(errorMassage: e.toString()));
  }

}
}
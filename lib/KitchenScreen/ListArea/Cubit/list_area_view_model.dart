import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/use_case.dart';
import 'State.dart';

class ListAreaViewModel extends Cubit<ListAreaState> {
  ListAreaUseCase useCase;
  ListAreaViewModel(this.useCase) : super(ListLoadingAreaState());

  void getCountry() async {
    try {
      emit(ListLoadingAreaState());
      var response = await useCase.invoke();
      if (response?.meals == null) {
        emit(ListErrorAreaState(errorMassage: 'Error'));
      } else {
        emit(ListSucssesAreaState(response: response));
      }
    } catch (e) {
      emit(ListErrorAreaState(errorMassage: e.toString()));
    }
  }
}

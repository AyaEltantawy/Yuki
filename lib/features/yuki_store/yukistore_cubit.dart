import 'package:bloc/bloc.dart';

import 'yukistore_state.dart';

class YukistoreCubit extends Cubit<YukistoreState> {
  YukistoreCubit() : super(YukistoreStateInit());

  bool change = true;


  int activeIndex = 0;

  updateActiveIndex(int index) {
    activeIndex = index;
    emit(ClickOnCategoryContainer());
  }
}

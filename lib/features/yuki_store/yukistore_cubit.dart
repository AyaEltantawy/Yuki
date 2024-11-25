import 'package:bloc/bloc.dart';

import 'yukistore_state.dart';

class YukistoreCubit extends Cubit<YukistoreState> {
  YukistoreCubit() : super(YukistoreStateInit());

  bool change = true;
 // List<int> isSelected = [0, 1, 2]; // Track each category selection

  int activeIndex = 0;

  updateActiveIndex(int index) {
    activeIndex = index;
    emit(ClickOnCategoryContainer());
  }
}

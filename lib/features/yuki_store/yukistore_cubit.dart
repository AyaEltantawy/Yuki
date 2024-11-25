import 'package:bloc/bloc.dart';

import 'yukistore_state.dart';

class YukistoreCubit extends Cubit<YukistoreState> {
  YukistoreCubit() : super(YukistoreStateInit());

  bool change = true;
  List<bool> isSelected = [false, true, false]; // Track each category selection

  void toggleCategorySelection(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = (i == index); // Select only the clicked category
    }
    change = !change; // Example of changing another state variable
    emit(ClickOnCategoryContainer());
  }

  int activeIndex = 0;

  updateActiveIndex(int index) {
    activeIndex = index;
    emit(ClickOnCategoryContainer());
  }
}

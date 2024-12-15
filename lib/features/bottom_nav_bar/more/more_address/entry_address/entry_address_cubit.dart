import 'package:bloc/bloc.dart';

import 'entry_address_state.dart';

class EntryAddressCubit extends Cubit<EntryAddressState> {
  EntryAddressCubit() : super(EntryAddressStateInit());
  bool isSelected =false;
  selectContainer(){
    isSelected =!isSelected;
    emit(SelectContainer());



  } int activeIndex = 0;

  updateActiveIndex(int index) {
    activeIndex = index;
    emit(ClickOnCategoryContainer());
  }
}

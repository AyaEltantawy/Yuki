import 'package:bloc/bloc.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartStateInit());
  bool isChecked =false;
  toggleCheck(){

    isChecked=!isChecked;
    emit(ToggleCheck());


  }
}

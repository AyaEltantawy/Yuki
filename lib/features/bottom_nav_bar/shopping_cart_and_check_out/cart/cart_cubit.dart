import 'package:bloc/bloc.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/cart_response.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartStateInit()) {
    fetchCartProducts();
  }

  bool isChecked = false;

  toggleCheck() {
    isChecked = !isChecked;
    emit(ToggleCheck());
  }

  CartResponse? cartResponse;

  fetchCartProducts() async {
    emit(FetchCartLoadingState());
    final response = await DioHelper.get("get-cart");
    final data = response!.data as Map<String, dynamic>;
    if (data['status'] == true) {
      cartResponse = CartResponse.fromJson(data);
      emit(FetchCartSuccessState());
    } else {
      emit(FetchCartErrorState());
    }
  }

}

import 'package:bloc/bloc.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/cart_response.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/utils/utils.dart';

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
  List<Items>? items;
  fetchCartProducts() async {
    emit(FetchCartLoadingState());
    final response = await DioHelper.get("get-cart");
    final data = response!.data as Map<String, dynamic>;
    if (data['status'] == true) {
      cartResponse = CartResponse.fromJson(data);
      items=cartResponse?.data?.order?.items;
      emit(FetchCartSuccessState());
    } else {
      emit(FetchCartErrorState());
    }
  }

  int? productId;

  fetchProductId(int? productId) {
    this.productId = productId;
    deleteCartProduct();
  }

  deleteCartProduct() async {
    final body = {
      'id': productId,
    };
    emit(DeleteProductLoadingState());
    final response = await DioHelper.post('delet-from-cart', false, body: body)
        .then((response) {
      final data = response.data as Map<String, dynamic>;

      if (data['status'] == true) {
        emit(DeleteProductSuccessState());
        Utils.showSnackBar(MagicRouter.currentContext, data['message']);
        fetchCartProducts();
        print(productId);
      } else {
        emit(DeleteProductErrorState());
      }
    });
  }

  late List<int> count;

  void initializeCount( ) {
    count = List.generate(items?.length??1, (index) => items?[index].quantity ?? 1);
  }


  increament( int index) {
    count[index]++;
    emit(Increment());
  }

  decreament(int index) {
    if (count[index] > 1) {
      count[index]--;
    }
    emit(Decrement());
  }
}

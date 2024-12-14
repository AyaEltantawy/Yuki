import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/favorite_products_response.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/utils/utils.dart';

import 'favoriteproducts_state.dart';

class FavoriteProductsCubit extends Cubit<FavoriteProductsState> {
  FavoriteProductsCubit() : super(FavoriteProductsStateInit()) {
    fetchFavoriteProducts();
    addFavoriteProducts(productId);
  }

  FavoriteProductsResponse? favoriteProductsResponse;
  List<Products>? products;

  fetchFavoriteProducts() async {
    emit(FavoriteProductsLoadingState());
    final response = await DioHelper.get("products/favourites");
    final data = response!.data as Map<String, dynamic>;
    if (data['status'] == true) {
      favoriteProductsResponse = FavoriteProductsResponse.fromJson(data);
      products = favoriteProductsResponse?.data?.products;
      emit(FavoriteProductsSuccessState());
    } else {
      emit(FavoriteProductsErrorState());
    }
  }

  int? productId;

  void addFavoriteProductsById(int? productId) {
    this.productId = productId;
    addFavoriteProducts(productId);
    emit(AddFavoriteProductsState());
  }

  addFavoriteProducts(productId) async {
    emit(AddFavoriteProductsLoadingState());

    DioHelper.post("favourite/$productId", false, body: null).then((response) {
      final data = response.data as Map<String, dynamic>;
      print("dataaa $data");
      print(' jdshjhfdsjbdsj${data['message']}');

      if (data['status'] == true) {
        Utils.showSnackBar(
          MagicRouter.currentContext,
          data['message'],
        );

        emit(AddFavoriteProductsSuccessState());
      } else {
        Utils.showSnackBar(
          MagicRouter.currentContext,
          data['message'],
        );
        emit(AddFavoriteProductsErrorState());
      }
    });
  }
}

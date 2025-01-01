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
    // addFavoriteProducts(productId ?? 0);
  }
  int count=1;
  void increament() {
    count++;
  }

  void decreament() {
    if (count > 1) {
      count--;
    }}
  FavoriteProductsResponse? favoriteProductsResponse;
  List<Products>? products;
  List favorites = [];
  Set<int?> favoriteID = {};

  Future<void> fetchFavoriteProducts() async {
    emit(FavoriteProductsLoadingState());
    final response = await DioHelper.get("products/favourites");
    final data = response!.data as Map<String, dynamic>;
    if (data['status'] == true) {
      favoriteProductsResponse = FavoriteProductsResponse.fromJson(data);
      products = favoriteProductsResponse?.data?.products;
      // for (var item in data['data']) {
      //   favorites.add(products ?? []);
      // }
      for (var item in products ?? []) {
        favoriteID.add(item.id ?? 0);
      }
      emit(FavoriteProductsSuccessState());
    } else {
      emit(FavoriteProductsErrorState());
    }
  }
}

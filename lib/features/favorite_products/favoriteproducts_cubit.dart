import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/favorite_products_response.dart';

import 'favoriteproducts_state.dart';

class FavoriteProductsCubit extends Cubit<FavoriteProductsState> {
  FavoriteProductsCubit() : super(FavoriteProductsStateInit()){

    fetchFavoriteProducts();
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
}

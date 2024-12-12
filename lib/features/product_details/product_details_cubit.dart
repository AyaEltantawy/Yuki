import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/products_details_response.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/theming/colors.dart';

import 'package:yuki/features/product_details/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsStateInit()) {
    fetchProductDetails(id ?? 0);
    // getProductDetails(id??0);
  }

  double rateAmount = 0;
  bool onPress = false;
  int currentPage = 0;

  List text = ["Ingredients", "How to Use"];
  int index = 0;

  updateIngredientsAndUseTo(index) {
    this.index = index;
    emit(UpdateIngredientsAndUseTo());
  }

  void getProductDetails(int productId) {
    id = productId;
    fetchProductDetails(productId);
    emit(GetProductDetailsState());
  }

  void updateIndicator(value) {
    currentPage = value;

    emit(BuildCarouselIndicator());
  }

  bool isSelected = false;

  updatContainerOnStack(value) {
    currentPage = value;
    emit(UpdateContainerOnStack());
  }

  int value = 0;

  updateArrowRight(value) {
    if (currentPage == value)
// currentPage=value;
      emit(UpdateArrowRight());
  }

  int count = 1;

  void increament() {
    count++;
    emit(UpdateIncrement());
  }

  void decreament() {
    if (count > 1) {
      count--;
      emit(UpdateDecrement());
    }
  }

  int? id;

  updateRating(rating) {
    rateAmount = rating;
    emit(UpdateRating());
  }

  ProductDetailsResponse? productDetailsResponse;
  Product? product;
  List<dynamic>? images ;
  String? imageUrl;
  fetchProductDetails(int id) async {
    emit(ProductDetailsLoadingState());
    final response = await DioHelper.get("products/$id");
    final data = response!.data as Map<String, dynamic>;
    print("asdcdcdcddedededddc $data");
    if (data['status'] == true) {
      print(id);
      productDetailsResponse = ProductDetailsResponse.fromJson(data);
      product=productDetailsResponse?.data?.product;
     images =productDetailsResponse?.data?.product?.images;
      if ((images?.isNotEmpty)??true ) {
       imageUrl  = images?[0]['url'];
        print("Image URL: $imageUrl");
      } else {
        print("No images found.");
      }
      emit(ProductDetailsSuccessState());
    } else {
      emit(ProductDetailsErrorState());
    }
  }
}

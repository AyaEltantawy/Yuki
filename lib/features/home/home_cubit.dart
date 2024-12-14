import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/app_storage/app_storage.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/home_model.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInit()) {
    fetchHome();
  }

  int indexArriveAndFeatured = 0;
  int currentPage = 0;
  List<Widget> items = [
    Image.asset(
      "assets/images/image_home.png",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/image_home.png",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/image_home.png",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/image_home.png",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/image_home.png",
      fit: BoxFit.cover,
    ),
  ];

  buildCarouselIndicator() {
    return Positioned(
      bottom: 7.h,
      right: 10.w,
      left: 10.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < items.length; i++)
            Container(
              margin: const EdgeInsets.all(5),
              height: 8.w,
              width: 8.h,
              decoration: BoxDecoration(
                  color: i == currentPage
                      ? Colors.white
                      : Colors.white.withOpacity(.5),
                  shape: BoxShape.circle),
            ),
        ],
      ),
    );
  }

  void updateIndicator(value) {
    currentPage = value;
    emit(BuildCarouselIndicator());
  }

  updateArrivalsAndFeatured(index) {
    this.indexArriveAndFeatured = index;
    emit(UpdateArrivalsAndFeatured());
  }



// int index =0;
//   bool isFavorite =false;
//   updateFavorite(int index){
// //isFavorite = ! isFavorite;
//     this.index = index;
//     emit(UpdateFavorite());
//
//   }
  Set<int> favoriteIndices = {};

  void toggleFavorite(int index) {
    if (!favoriteIndices.contains(index)) {
      favoriteIndices.add(index);
      emit(UpdateFavorite());
    }
  }


  HomeModel? homeModel;
  List<Banners>? banners;
  List<Category>? categories = [];
  Products? featured;
  Products? products;

  //String name;
  void fetchHome() async {
    emit(HomeLoadingState());
    final response = await DioHelper.get("home");
    final data = response!.data as Map<String, dynamic>;

    if (data['status'] == true) {
      homeModel = HomeModel.fromJson(data);
      banners = homeModel?.data?.banners;
      categories = homeModel?.data?.categories;
      featured = homeModel?.data?.featured;
      products = homeModel?.data?.products;
      // name=homeModel?.data?.categories?[0].name??'';
      emit(HomeSuccessState());
    } else {
      debugPrint("errorr ${data['message']}");
      emit(HomeErrorState());
    }
  }
}

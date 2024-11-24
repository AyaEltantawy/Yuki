import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInit());
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
  bool isArrival = true;
void updateArrivalsAndFeatured(){

    isArrival =! isArrival;

    emit(UpdateArrivalsAndFeatured());






}



}

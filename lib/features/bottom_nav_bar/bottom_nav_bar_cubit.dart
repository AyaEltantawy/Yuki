import 'package:bloc/bloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/features/bottom_nav_bar/categories/categories_view.dart';
import 'package:yuki/features/bottom_nav_bar/home/home_view.dart';
import 'package:yuki/features/bottom_nav_bar/more/more_view.dart';
import 'package:yuki/features/bottom_nav_bar/shopping_cart_and_check_out/cart/cart_view.dart';

import 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarStateInit());
  int index = 0;

  // GlobalKey for navigation (not mandatory in this use case)
  final GlobalKey<CurvedNavigationBarState> navigationKey = GlobalKey();

  List<Widget> get items => [
    Image.asset(
      index == 0
          ? "assets/images/home_icon_white.png"
          : "assets/images/home_icon.png",
      width: 24.w,
      height: 24.w,
    ),
    SvgPicture.asset(
      index == 1
          ? "assets/svgs/category_icon_white.svg"
          : "assets/svgs/Vector.svg",
      width: 24.w,
      height: 24.w,
    ),
    SvgPicture.asset(
      index == 2 ? "assets/svgs/Bag.svg" : "assets/svgs/Bag 6.svg",
      width: 24.w,
      height: 24.w,
    ),
    SvgPicture.asset(
      index == 3
          ? "assets/svgs/more_vertical.svg"
          : "assets/svgs/menu_icon.svg",
      width: 24.w,
      height: 24.w,
    ),
  ];

  final List screens = [
    HomePage(index: 1),
    CategoriesPage(id: 0),
    CartPage(),
    MorePage(),
  ];

  updateIndex (newIndex){
    index = newIndex;
    emit(UpdateIndex());
  }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/features/cart/cart_view.dart';
import 'package:yuki/features/categories/categories_view.dart';
import 'package:yuki/features/home/home_view.dart';
import 'package:yuki/features/more/more_view.dart';

class CustomCurvedNavigationBar extends StatefulWidget {
  const CustomCurvedNavigationBar({super.key});

  @override
  State<CustomCurvedNavigationBar> createState() =>
      _CustomCurvedNavigationBarState();
}

class _CustomCurvedNavigationBarState extends State<CustomCurvedNavigationBar> {
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
    HomePage(),
    CategoriesPage(),
    CartPage(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        key: navigationKey,
        // Use the correct key here

        items: items,
        backgroundColor: Colors.transparent,
        index: index,
        animationDuration: const Duration(milliseconds: 600),
        // Adjusted for smoother animation
        height: 75.h,
        onTap: (index) => setState(() => this.index = index),
        buttonBackgroundColor: ColorsManager.mainblue,
        animationCurve: Curves.decelerate,
        color: Colors.white,


      ),
    );
  }
}

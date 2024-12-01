import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/features/categories/widgets/custom_category_in_horizontal.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

import 'categories_cubit.dart';
import 'categories_state.dart';
import 'package:badges/badges.dart' as badges;

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CategoriesCubit(),
        child: Scaffold(
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/girl_photo_in_home.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/svgs/logo.svg",
                      width: 45.w,
                      height: 45.h,
                    ),
                    badges.Badge(
                      position: badges.BadgePosition.topEnd(top: -4, end: 1),
                      child: SvgPicture.asset(
                        "assets/svgs/notification.svg",
                        width: 45.w,
                        height: 45.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Categories",
                    style: TextStyles.font20black700Weight,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Shop By Category",
                    style: TextStyles.font15Thirdgrey300Weight,
                  ),
                  const Divider(
                    thickness: 1,
                    color: ColorsManager.mainblue,
                  ),
                ]),
                SizedBox(
                  height: 20.h,
                ),
                const CustomCategoryInHorizontal(
                  imageUrl: "assets/images/hair_care.png",
                  categoryName: 'Hair Care',
                  categoryCount: '489 Product',
                ),
                SizedBox(
                  height: 5.h,
                ),
                const Divider(
                  thickness: 1,
                  color: ColorsManager.bordergrey,
                ),
                SizedBox(
                  height: 10.h,
                ),
                const CustomCategoryInHorizontal(
                  categoryCount: '489 Product',
                  imageUrl: 'assets/images/body_care.png',
                  categoryName: 'Body Care',
                ),
                SizedBox(
                  height: 5.h,
                ),
                const Divider(
                  thickness: 1,
                  color: ColorsManager.bordergrey,
                ),
                SizedBox(
                  height: 10.h,
                ),
                const CustomCategoryInHorizontal(
                    imageUrl: "assets/images/skin_care.png",
                    categoryName: "Skin Care",
                    categoryCount: '489 Product'),
                SizedBox(
                  height: 5.h,
                ),
                const Divider(
                  thickness: 1,
                  color: ColorsManager.bordergrey,
                ),
              ],
            ),
          ),
        ));
  }
}

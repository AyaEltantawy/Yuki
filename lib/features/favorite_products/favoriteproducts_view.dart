import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/shared_widgets/custom_product.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

import 'favoriteproducts_cubit.dart';
import 'favoriteproducts_state.dart';
import 'package:badges/badges.dart' as badges;

class FavoriteProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => FavoriteProductsCubit(),
        child: Scaffold(
            body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Image.asset("assets/images/back_arow.png"),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: ColorsManager.grey,
                  //       borderRadius: BorderRadius.circular(5)),
                  //   child: Padding(
                  //     padding:  EdgeInsets.symmetric(horizontal: 15.w,),
                  //     child: IconButton(
                  //       onPressed: () {},
                  //       icon: const Icon(
                  //         Icons.arrow_back,
                  //         color: ColorsManager.mainblue,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -4, end: 1),
                    child: SvgPicture.asset(
                      "assets/svgs/cart_icon.svg",
                      width: 45.w,
                      height: 45.h,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Favorite Products",
                style: TextStyles.font20black700Weight,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Your Favorite Products",
                style: TextStyles.font15Textgrey300Weight,
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(thickness: 1, color: ColorsManager.mainblue),
              SizedBox(
                height: 10.h,
              ),
              StaggeredGrid.count(
                  axisDirection: AxisDirection.down,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    for (int i = 0; i < 5; i++)

                        CustomProduct(onTap:(){},
                            previosPrice: 180.00,
                            productName: "keratin serum",
                            imageUrl: ("assets/images/spray.png"),
                            currentPrice: 150.00,
                            offerState: "10% 0ff")
                  ])
            ],
          ),
        )));
  }
}

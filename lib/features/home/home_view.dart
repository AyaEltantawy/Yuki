import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/features/categories/widgets/custom_category_in_horizontal.dart';

import 'package:yuki/core/shared_widgets/custom_product.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:badges/badges.dart' as badges;

import 'package:yuki/features/home/widgets/custom_carousal_slider_home.dart';
import 'package:yuki/features/home/widgets/custom_category_in_vertical.dart';
import 'package:yuki/features/product_details/product_details_view.dart';
import 'package:yuki/features/yuki_store/yukistore_view.dart';
import 'home_cubit.dart';
import 'home_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:yuki/core/theming/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..buildCarouselIndicator(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final controller = BlocProvider.of<HomeCubit>(context);
              return ListView(
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
                          "assets/svgs/notify.svg",
                          width: 45.w,
                          height: 45.h,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CustomTextFormFeild(
                    hint: "What are you looking for ?",
                    hintColor: ColorsManager.icongrey,
                    prefixIcon:
                        Icon(Icons.search, color: ColorsManager.mainblue),
                    fillColor: ColorsManager.grey,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomCarousalSliderHome(
                    items: controller.items
                        .map((e) => Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: e))
                        .toList(),
                    onPageChanged: (value, _) =>
                        controller.updateIndicator(value),
                    currentPage: controller.currentPage, autoPlay: true,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Flash Sale",
                              style: TextStyles.font15Secondblack700Weight),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text("Discover Our Flash Sale",
                              style: TextStyles.font12Textgrey400Weight)
                        ],
                      ),
                      Container(
                          width: 45.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                              color: ColorsManager.grey,
                              borderRadius: BorderRadius.circular(40)),
                          child: const Icon(Icons.arrow_forward_outlined,
                              color: ColorsManager.mainblue)),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 267.5.h,
                    child: ListView.separated(
                      itemBuilder: (context, index) => CustomProduct(
                        onTap:(){},
                        productName: 'keratin serum',
                        imageUrl: 'assets/images/spray.png',
                        currentPrice: 150,
                        previosPrice: 180,
                        offerState: '10% Off',
                      ),
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10.w,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Divider(
                    thickness: 1,
                    color: ColorsManager.bordergrey,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Categories",
                              style: TextStyles.font15Secondblack700Weight),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text("Shop By Category",
                              style: TextStyles.font12Textgrey400Weight)
                        ],
                      ),
                      Container(
                          width: 45.w,
                          height: 45.w,
                          decoration: BoxDecoration(
                              color: ColorsManager.grey,
                              borderRadius: BorderRadius.circular(40)),
                          child: const Icon(Icons.arrow_forward_outlined,
                              color: ColorsManager.mainblue)),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(onTap: (){MagicRouter.navigateTo(YukistorePage());},
                        child: CustomCategory(
                          categoryName: "Hair Care",
                          categoryCount: "489 Product",
                          imageUrl: 'assets/images/hair_care.png',
                        ),
                      ),
                      CustomCategory(
                        categoryName: "Body Care",
                        categoryCount: "489 Product",
                        imageUrl: 'assets/images/body_care.png',
                      ),
                      CustomCategory(
                        categoryName: "Skin Care",
                        categoryCount: "489 Product",
                        imageUrl: 'assets/images/skin_care.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Divider(
                    thickness: 1,
                    color: ColorsManager.bordergrey,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          width: 162.5.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: controller.isArrival
                                ? ColorsManager.mainblue
                                : ColorsManager.grey,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/svgs/Star Fall.svg"),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "New Arrivals",
                                  style: controller.isArrival
                                      ? TextStyles.font14White700Weight
                                      : TextStyles.font14blackWei400ght,
                                )
                              ]),
                        ),
                        onTap: () {
                          controller.updateArrivalsAndFeatured();
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          width: 162.5.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: controller.isArrival
                                ? ColorsManager.grey
                                : ColorsManager.mainblue,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/svgs/Star Shine.svg"),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "Featured",
                                  style: controller.isArrival
                                      ? TextStyles.font14blackWei400ght
                                      : TextStyles.font14White700Weight,
                                )
                              ]),
                        ),
                        onTap: () {
                          controller.updateArrivalsAndFeatured();
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 267.5.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        //physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, builder) => CustomProduct(
                          onTap: (){MagicRouter.navigateTo(ProductdetailsPage(rateAmount: 0, reviewText: '',));},
                              productName: "deodorant whit...",
                              imageUrl: "assets/images/Group 3.png",
                              currentPrice: 150.00,
                              offerState: "New",
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10.w,
                            ),
                        itemCount: 5),
                  ),

                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/features/categories/categories_view.dart';
import 'package:yuki/features/categories/widgets/custom_category_in_horizontal.dart';

import 'package:yuki/core/shared_widgets/custom_product.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:badges/badges.dart' as badges;

import 'package:yuki/features/home/widgets/custom_carousal_slider_home.dart';
import 'package:yuki/features/home/widgets/custom_category_in_vertical.dart';
import 'package:yuki/features/home/widgets/image_and_logo_and_notification.dart';
import 'package:yuki/features/home/widgets/new_arrival_and_features.dart';
import 'package:yuki/features/home/widgets/row_text_and_arrow.dart';
import 'package:yuki/features/product_details/product_details_view.dart';
import 'package:yuki/features/yuki_store/yukistore_view.dart';
import 'home_cubit.dart';
import 'home_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:yuki/core/theming/styles.dart';

class HomePage extends StatelessWidget {
  int index;

  HomePage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HomeCubit(),
        child: Scaffold(body: SafeArea(
            child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          final controller = BlocProvider.of<HomeCubit>(context);
          return state is HomeLoadingState
              ? const Center(child: CircularProgressIndicator())
              : state is HomeErrorState
                  ? const Text("error")
                  : ListView(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      shrinkWrap: true,
                      children: [
                          const ImageAndLogoAndNotification(),
                          SizedBox(
                            height: 20.h,
                          ),
                          const CustomTextFormFeild(
                            hint: "What are you looking for ?",
                            hintColor: ColorsManager.icongrey,
                            prefixIcon: Icon(Icons.search,
                                color: ColorsManager.mainblue),
                            fillColor: ColorsManager.grey,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomCarousalSliderHome(
                            items: controller.banners!
                                .map(
                                  (banner) => Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image:
                                              NetworkImage(banner.image ?? ''),
                                          // Adjust image usage
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                )
                                .toList(),
                            onPageChanged: (value, _) =>
                                controller.updateIndicator(value),
                            currentPage: controller.currentPage,
                            autoPlay: true,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          RowTextAndArrow(
                            title: "Flash Sale",
                            description: "Descover Our Flash Sale",
                          ),
                          SizedBox(
                            height: 30.h,
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
                          RowTextAndArrow(
                            title: "Categories",
                            description: "Shop by Category",
                            onTap: () {
                              MagicRouter.navigateTo(CategoriesPage(id: 0));
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                    controller.categories?.length ?? 3,
                                    (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      MagicRouter.navigateTo(
                                          const YukistorePage(
                                        category_id: 0,
                                      ));
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: CustomCategory(
                                        categoryName: controller
                                                .categories?[index].name ??
                                            "",
                                        categoryCount: controller
                                                .categories?[index].products ??
                                            20,
                                        imageUrl: controller
                                                .categories?[index].image ??
                                            "",
                                      ),
                                    ),
                                  );
                                })),
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
                              children: List.generate(2, (index) {
                            List text = ["NewArrivals", "Featured"];
                            List radius = [4.0, 10.0];
                            List svgUrl = [
                              "assets/svgs/Star Fall.svg",
                              "assets/svgs/Star Shine.svg"
                            ];
                            return NewArrivalAndFeatures(
                              text: text[index],
                              radius: radius[index],
                              svgUrl: svgUrl[index],
                              isArrival: controller.indexArriveAndFeatured == index,
                              updateArrivalsAndFeatured: () =>
                                  controller.updateArrivalsAndFeatured(index),
                            );
                          })),
                          SizedBox(
                            height: 20.h,
                          ),
                          if (controller.indexArriveAndFeatured == 1)
                            SizedBox(
                              height: 276.5.h,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  //shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      CustomProduct(
                                        onTapFavorite: () {
                                          controller.updateFavorite(index);
                                        },

                                        isFavourite: controller.index == index,
                                        onTap: () {
                                          MagicRouter.navigateTo(
                                              ProductDetailsPage(
                                                  rateAmount: 0,
                                                  reviewText: '',
                                                  id: controller.featured
                                                          ?.items?[index].id ??
                                                      3));
                                        },
                                        productName: controller
                                                .featured?.items?[index].name ??
                                            '',
                                        imageUrl: controller.featured
                                                ?.items?[index].image ??
                                            '',
                                        currentPrice: controller
                                                .featured
                                                ?.items?[index]
                                                .priceAfterDiscount ??
                                            0.0,
                                        offerState: controller.featured
                                                ?.items?[index].statusKey ??
                                            '',
                                      ),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                  itemCount:
                                      controller.featured?.items?.length ?? 3),
                            ),
                          if (controller.indexArriveAndFeatured == 0)
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  controller.products?.items?.length ?? 3,
                                  (index) {
                                    return Row(
                                      children: [
                                        CustomProduct(
                                          onTapFavorite: () {
                                            controller.updateFavorite(index);
                                          },
                                          isFavourite:
                                              controller.indexArriveAndFeatured == index,
                                          onTap: () {
                                            MagicRouter.navigateTo(
                                                ProductDetailsPage(
                                                    rateAmount: 0,
                                                    reviewText: '',
                                                    id: controller
                                                            .products
                                                            ?.items?[index]
                                                            .id ??
                                                        3));
                                          },
                                          productName: controller.products
                                                  ?.items?[index].name ??
                                              '',
                                          imageUrl: controller.products
                                                  ?.items?[index].image ??
                                              '',
                                          currentPrice: controller
                                                  .products
                                                  ?.items?[index]
                                                  .priceAfterDiscount ??
                                              0.0,
                                          offerState: controller.products
                                                  ?.items?[index].statusKey ??
                                              '',
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                        ]);
        }))));
  }
}

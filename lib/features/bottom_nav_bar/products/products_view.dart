import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/category_container.dart';
import 'package:yuki/core/shared_widgets/custom_product.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/shared_widgets/filter_buttom_sheet.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/bottom_nav_bar/categories/categories_view.dart';
import '../product_details/product_details_view.dart';
import 'products_cubit.dart';
import 'products_state.dart';

class ProductsPage extends StatelessWidget {
  final int? categoryId;
  final int? sub_category_id;

  const ProductsPage({
    super.key,
    this.categoryId,
    this.sub_category_id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ProductsCubit()..categoryId = categoryId,
      child: Scaffold(
        body: SafeArea(child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
          final controller = BlocProvider.of<ProductsCubit>(context);
          final cubit = context.read<ProductsCubit>();
          return (state is ProductsLoadingState ||
                  state is SubCategoriesLoadingState)
              ? const Center(child: CircularProgressIndicator())
              : state is ProductsErrorState
                  ? const Text("error")
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      child: ListView(shrinkWrap: true, children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                MagicRouter.navigateTo(CategoriesPage(
                                  id: categoryId,
                                ));
                              },
                              child: Image.asset("assets/images/back_arow.png"),
                            ),
                            badges.Badge(
                              position:
                                  badges.BadgePosition.topEnd(top: -4, end: 1),
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
                          "Yuki Store",
                          style: TextStyles.font20black700Weight,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Browse Our Products",
                          style: TextStyles.font15Textgrey300Weight,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: CustomTextFormFeild(
                                hint: "What are you looking for ?",
                                hintColor: ColorsManager.icongrey,
                                prefixIcon: Icon(Icons.search,
                                    color: ColorsManager.mainblue),
                                fillColor: ColorsManager.grey,
                                radius: 5,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => FilterButtomSheet(),
                                );
                              },
                              child: Image.asset(
                                "assets/images/filter_icon.png",
                                width: 51.w,
                                height: 51.w,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Divider(
                          thickness: 1,
                          color: ColorsManager.mainblue,
                        ),
                        SizedBox(height: 10.h),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            CategoryContainer(
                              onTap: () {
                                cubit.updateActiveIndex(0);
                              },
                              title: "All",
                              vertical: 5.h,
                              horizontal: 10.w,
                              isSelected: cubit.subCategoryId == 0,
                              radius: 5,
                            ),
                            ...List.generate(
                              (controller.subcategories.length),
                              (index) {
                                return GestureDetector(
                                  onTap: () {
                                    cubit.updateActiveIndex(
                                        controller.subcategories[index].id);
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0.w),
                                    child: CategoryContainer(
                                      title: controller
                                              .subcategories?[index].name ??
                                          '',
                                      vertical: 5.h,
                                      horizontal: 10.w,
                                      isSelected: cubit.subCategoryId ==
                                          controller.subcategories[index].id,
                                      radius: 5,
                                      // change: cubit.change,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ]),
                        ),
                        MasonryGridView.count(
                            scrollDirection: Axis.vertical,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 10,
                            itemCount:
                                controller.productsModel?.data?.items?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomProduct(
                                onTapFavorite: () => {
                                  controller.toggleFavorite(index),
                                  controller.onTapProduct(controller
                                      .productsModel?.data?.items?[index].id),
                                  // MagicRouter.navigateTo(FavoriteProductsPage(id: controller.productsModel
                                  //     ?.data?.items?[i].id,)

                                  cubit.addFavoriteProductsById(controller
                                      .productsModel?.data?.items?[index].id)
                                },
                                isFavourite:
                                    controller.favoriteIndices.contains(index),
                                onTap: () {
                                  controller.onTapProduct(controller
                                      .productsModel?.data?.items?[index].id);

                                  MagicRouter.navigateTo(ProductDetailsPage(
                                      rateAmount: 0,
                                      reviewText: '',
                                      id: controller.productId ?? 0));
                                },
                                productName: controller.productsModel?.data
                                        ?.items?[index].name ??
                                    "",
                                imageUrl: controller.productsModel?.data
                                        ?.items?[index].image ??
                                    "",
                                currentPrice: controller.productsModel?.data
                                        ?.items?[index].price ??
                                    3,
                                offerState: controller.productsModel?.data
                                        ?.items?[index].statusKey ??
                                    "",
                              );
                            }),
                        SizedBox(
                          height: 10.h,
                        )
                      ]),
                    );
        })),
      ),
    );
  }
}

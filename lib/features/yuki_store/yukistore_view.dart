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
import 'package:yuki/features/categories/categories_view.dart';
import 'package:yuki/features/product_details/product_details_view.dart';

import 'yukistore_cubit.dart';
import 'yukistore_state.dart';

class YukistorePage extends StatelessWidget {
  final int category_id;
  final int? sub_category_id;

  const YukistorePage({
    super.key,
    required this.category_id,
    this.sub_category_id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          YukistoreCubit()..categoryId = category_id,
      child: Scaffold(
        body: SafeArea(child: BlocBuilder<YukistoreCubit, YukistoreState>(
            builder: (context, state) {
          final controller = BlocProvider.of<YukistoreCubit>(context);

          final cubit = context.read<YukistoreCubit>();

          return state is ProductsLoadingState ||
                  state is SubCategoriesLoadingState
              ? const Center(child: CircularProgressIndicator())
              : state is ProductsErrorState
                  ? const Text("error")
                  : ListView(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  MagicRouter.navigateTo(CategoriesPage(
                                    id: category_id,
                                  ));
                                },
                                child:
                                    Image.asset("assets/images/back_arow.png"),
                              ),
                              badges.Badge(
                                position: badges.BadgePosition.topEnd(
                                    top: -4, end: 1),
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.0.w),
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
                          SizedBox(
                            height: 10.h,
                          ),
                          StaggeredGrid.count(
                              axisDirection: AxisDirection.down,
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              children: [
                                for (int i = 0;
                                    i <
                                        (controller.productsModel?.data?.items
                                                ?.length ??
                                            3);
                                    i++)
                                  CustomProduct(
                                      onTapFavorite: () {
                                        return controller
                                            .toggleFavorite(i);
                                      },
                                      isFavourite: controller.favoriteIndices
                                          .contains(i),
                                      onTap: () {
                                        controller.onTapProduct(controller
                                            .productsModel?.data?.items?[i].id);

                                        MagicRouter.navigateTo(
                                            ProductDetailsPage(

                                                rateAmount: 0,
                                                reviewText: '',
                                                id: controller.productId??0));
                                      },
                                      // previosPrice: 180.00,

                                      productName: controller.productsModel
                                              ?.data?.items?[i].name ??
                                          "",
                                      imageUrl: controller.productsModel?.data
                                              ?.items?[i].image ??
                                          "",
                                      currentPrice: controller.productsModel
                                              ?.data?.items?[i].price ??
                                          3,
                                      offerState: controller.productsModel?.data
                                              ?.items?[i].statusKey ??
                                          ""),
                              ])
                        ]);
        })),
      ),
    );
  }
}

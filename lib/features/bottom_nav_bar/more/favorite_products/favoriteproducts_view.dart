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
  const FavoriteProductsPage({super.key, this.id});

  final int? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => FavoriteProductsCubit(),
        //..addFavoriteProductsById(id),
        child: Scaffold(body: SafeArea(
          child: BlocBuilder<FavoriteProductsCubit, FavoriteProductsState>(
            builder: (context, state) {
              final controller =
                  BlocProvider.of<FavoriteProductsCubit>(context);

              return state is FavoriteProductsLoadingState
                  // || state is AddFavoriteProductsLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : state is FavoriteProductsErrorState
                      ? const Text("error")
                      : ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: Image.asset(
                                      "assets/images/back_arow.png"),
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
                            const Divider(
                                thickness: 1, color: ColorsManager.mainblue),
                            SizedBox(
                              height: 10.h,
                            ),
                            MasonryGridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: controller.products?.length,
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                itemBuilder: (BuildContext context, int index) {
                                  return CustomProduct(
                                    onTap: () {},
                                    onTapFavorite: () {
                                      // return controller.addFavoriteProducts(
                                      //     controller.products?[i].id ?? 0);
                                    },
                                    productName:
                                        controller.products?[index].name ?? '',
                                    imageUrl:
                                        controller.products?[index].image ?? '',
                                    currentPrice:
                                        controller.products?[index].price ?? 0,
                                    offerState:
                                        controller.products?[index].statusKey ??
                                            '',
                                  );
                                })
                          ],
                        );
            },
          ),
        )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/shared_widgets/shopping_cart.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/bottom_nav_bar/shopping_cart_and_check_out/selectdeliveryaddress/select_delivery_address_view.dart';

import 'cart_cubit.dart';
import 'cart_state.dart';
import 'package:badges/badges.dart' as badges;

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CartCubit(),
        child: Scaffold(
          body: SafeArea(
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                final controller = BlocProvider.of<CartCubit>(context);
                return ListView(
                    shrinkWrap: true,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
                            position:
                                badges.BadgePosition.topEnd(top: -4, end: 1),
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
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shopping Cart",
                              style: TextStyles.font20black700Weight,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Browse your cart and complete checkout.",
                              style: TextStyles.font15Thirdgrey300Weight,
                            ),
                            const Divider(
                              thickness: 1,
                              color: ColorsManager.mainblue,
                            ),
                          ]),
                      SizedBox(
                        height: 10.h,
                      ),
                      state is FetchCartLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : state is FetchCartErrorState
                              ? const Text("error")
                              : SizedBox(
                                  height: 300.h,
                                  child: ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          ShoppingCart(
                                            isDelete: true,
                                            name: controller
                                                .cartResponse
                                                ?.data
                                                ?.order
                                                ?.items?[index]
                                                .productName,
                                            price: controller.cartResponse?.data
                                                ?.order?.items?[index].price,
                                          ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                      itemCount: controller.cartResponse?.data
                                              ?.order?.items?.length ??
                                          3),
                                ),
                      const Divider(
                          thickness: 1, color: ColorsManager.bordergrey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: controller.isChecked,
                            onChanged: (context) => controller.toggleCheck(),
                            activeColor: ColorsManager.mainblue,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(50), // Rounded checkbox
                            ),
                          ),
                          Text(
                            "Buy as a gift ?",
                            style: TextStyles.font14blackWei400ght,
                          ),
                        ],
                      ),
                      CustomTextFormFeild(
                        prefixIcon: Image.asset("assets/images/Pen 2.png"),
                        hint: "Write message here ...",
                        fillColor: ColorsManager.grey,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const Divider(
                          thickness: 1, color: ColorsManager.bordergrey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "No. Of Products",
                            style: TextStyles.font15Icongrey400Weight,
                          ),
                          Text(
                            "7",
                            style: TextStyles.font15Black400Weight,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Price",
                            style: TextStyles.font15Icongrey400Weight,
                          ),
                          Text(
                            "810.00",
                            style: TextStyles.font15Black400Weight,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyles.font15Mainblue700Weight,
                          ),
                          Text(
                            "710.00",
                            style: TextStyles.font15Mainblue700Weight,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomButton(
                        child: Text("Continue to checkout",
                            style: TextStyles.font16White700Weight),
                        onPressed: () {
                          MagicRouter.navigateTo(SelectdeliveryaddressPage());
                        },
                      )
                    ]);
              },
            ),
          ),
        ));
  }
}

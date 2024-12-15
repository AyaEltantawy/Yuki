import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/category_container.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/shared_widgets/set_review_bottom_sheet.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/core/shared_widgets/custom_order.dart';
import 'package:yuki/features/bottom_nav_bar/more/more_orders/order_details/order_details_view.dart';
import 'orders_cubit.dart';
import 'orders_state.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OrdersCubit(),
      child: Scaffold(
        body: SafeArea(child: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            final controller = BlocProvider.of<OrdersCubit>(context);
            return ListView(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/back_arow.png"),
                    SvgPicture.asset(
                      "assets/svgs/cart_icon.svg",
                      width: 45.w,
                      height: 45.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "My Orders",
                  style: TextStyles.font20black700Weight,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Browse your orders list",
                  style: TextStyles.font15Thirdgrey300Weight,
                ),
                const Divider(
                  thickness: 1,
                  color: ColorsManager.mainblue,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextFormFeild(
                  prefixSvgAsset: "assets/svgs/History 2.svg",
                  fillColor: ColorsManager.grey,
                  hint: "Filter by order status",
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                    color: ColorsManager.greyblack,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                    children: List.generate(2, (index) {
                  final titels = ["Current Orders", "Past Orders"];

                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.selectContainer(index);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: CategoryContainer(
                            title: titels[index],
                            isSelected: controller.activeIndex == index,
                            horizontal: 20,
                            vertical: 10,
                            radius: 5),
                      ),
                    ),
                  );
                })),
                SizedBox(
                  height: 20.h,
                ),
                if (controller.activeIndex == 0)
                  Column(
                    children: [
                      CustomOrder(
                        onTap: () {
                          MagicRouter.navigateTo(OrderDetailsPage());
                        },
                        statusText: "In Review",
                        isReturn: false,
                        isCancel: true,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const CustomOrder(
                        isReturn: false,
                        statusText: "In Progress",
                        isCancel: false,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const CustomOrder(
                        isReturn: false,
                        statusText: "In Progress",
                        isCancel: false,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const CustomOrder(
                        statusText: "In the way",
                        isCancel: false,
                        isReturn: false,
                      ),
                    ],
                  ),
                SizedBox(
                  height: 10.h,
                ),
                if (controller.activeIndex == 1)
                  Column(
                    children: [
                      CustomOrder(
                        onTap: () {
                          MagicRouter.navigateTo(OrderDetailsPage(
                            orderStatus: "Delivered",
                            secondButtonText: "Return Order",
                            firstButtonText: "Rate Order",
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => SetReviewBottomSheet(
                                        rateAmount: 5,
                                      ));
                            },
                          ));
                        },
                        isCancel: true,
                        isReturn: false,
                        statusText: "Delivered",
                        firstButtonText: "Rate Order",
                        secondButtonText: "Return order",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const CustomOrder(
                        statusText: "Canceled",
                        firstButtonText: "Rate Order",
                        secondButtonText: "Return order",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomOrder(
                        onTap: () {},
                        isCancel: true,
                        isReturn: true,
                        statusText: "Delivered",
                        firstButtonText: "Rate Order",
                        secondButtonText: "Return order",
                      ),
                    ],
                  )
              ],
            );
          },
        )),
      ),
    );
  }
}

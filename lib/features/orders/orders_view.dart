import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/shared_widgets/category_container.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/orders/widgets/custom_order.dart';

import 'orders_cubit.dart';
import 'orders_state.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OrdersCubit(),
      child: Scaffold(
        body: SafeArea(
            child: BlocBuilder<OrdersCubit, OrdersState>(
              builder: (context, state) {
                final controller =  BlocProvider.of<OrdersCubit>(context);
                return ListView(
                  padding: EdgeInsets.symmetric(
                      vertical: 20.h, horizontal: 20.w),
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
                      children: [
                        Expanded(
                          child: CategoryContainer(
                              title: "Current Orders",
                              isSelected: controller.isSelected,
                              horizontal: 20,
                              vertical: 10,
                              radius: 5),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: CategoryContainer(
                              title: "Past Orders",
                              isSelected:controller. isSelected,
                              horizontal: 20,
                              vertical: 10,
                              radius: 5),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomOrder(isCancel: true,),
                    SizedBox(height: 10.h,),
                    CustomOrder(isCancel: false,),
                    SizedBox(height: 10.h,),
                    CustomOrder(isCancel: false,),
                    SizedBox(height: 10.h,),
                    CustomOrder(isCancel: false,),
                    SizedBox(height: 10.h,)
                  ],
                );
              },
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/core/shared_widgets/custom_order.dart';
import '../return_order_details/return_order_details_view.dart';
import 'return_orders_cubit.dart';
import 'return_orders_state.dart';

class ReturnOrdersPage extends StatelessWidget {
  const ReturnOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ReturnOrdersCubit(),
        child: Scaffold(body: SafeArea(child:
            BlocBuilder<ReturnOrdersCubit, ReturnOrdersState>(
                builder: (context, state) {
          final controller = BlocProvider.of<ReturnOrdersCubit>(context);
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
                  "Return Orders",
                  style: TextStyles.font20black700Weight,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Browse your return orders list",
                  style: TextStyles.font15Thirdgrey300Weight,
                ),
                const Divider(
                  thickness: 1,
                  color: ColorsManager.mainblue,
                ),
                SizedBox(
                  height: 10.h,
                ),
                const CustomTextFormFeild(
                  prefixSvgAsset: "assets/svgs/History 2.svg",
                  fillColor: ColorsManager.grey,
                  hint: "Filter by order status",
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                    color: ColorsManager.greyblack,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomOrder(
                    onTap: () {
                      MagicRouter.navigateTo(
                          ReturnOrderDtailsPage(orderStatus: "Accepted"));
                    },
                    statusText: "Accepted",
                    isCancel: false,
                    isReturn: true),
                SizedBox(
                  height: 10.h,
                ),
                const CustomOrder(
                    statusText: "Rejected", isCancel: false, isReturn: true),
                SizedBox(
                  height: 10.h,
                ),
                const CustomOrder(
                    statusText: "Pending", isCancel: false, isReturn: true),
                SizedBox(
                  height: 10.h,
                ),
                const CustomOrder(
                    statusText: "Accepted", isCancel: false, isReturn: true),
                SizedBox(
                  height: 10.h,
                ),
                const CustomOrder(
                    statusText: "Rejected", isCancel: false, isReturn: true),
              ]);
          ;
        }))));
  }
}

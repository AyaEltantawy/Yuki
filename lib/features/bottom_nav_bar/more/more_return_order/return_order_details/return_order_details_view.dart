import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import '../../more_orders/order_details/widgets/custom_products_in_order_details.dart';
import 'return_order_details_cubit.dart';
import 'return_order_details_state.dart';

class ReturnOrderDtailsPage extends StatelessWidget {
  const ReturnOrderDtailsPage(
      {super.key,
      this.orderStatus,
      this.firstButtonText,
      this.secondButtonText,
      this.onPressed});

  final String? orderStatus;
  final String? firstButtonText;

  final String? secondButtonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ReturnOrderDetailsCubit(),
        child: Scaffold(body: SafeArea(child:
            BlocBuilder<ReturnOrderDetailsCubit, ReturnOrderDetailsState>(
                builder: (context, state) {
          final controller = BlocProvider.of<ReturnOrderDetailsCubit>(context);
          return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                  "Return Order Details",
                  style: TextStyles.font20black700Weight,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Order No. #1236582",
                  style: TextStyles.font15Thirdgrey300Weight,
                ),
                const Divider(
                  thickness: 1,
                  color: ColorsManager.mainblue,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: ColorsManager.grey,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 48,
                            spreadRadius: 0,
                            color: Color(0xff0000000D))
                      ]),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: 20.h, bottom: 20.h, end: 170.w, start: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Order no. : ",
                              style: TextStyles.font13Icongrey400Weight,
                              children: [
                                TextSpan(
                                    text: "#46679797",
                                    style: TextStyles.font13black700Weight),
                              ]),
                        ),
                        SizedBox(height: 10.h),
                        RichText(
                          text: TextSpan(
                              text: "Order Status : ",
                              style: TextStyles.font13Icongrey400Weight,
                              children: [
                                TextSpan(
                                    text: orderStatus ?? "In Review",
                                    style: orderStatus == "Accepted"
                                        ? TextStyles.Font13Stronggreen700Weight
                                        : TextStyles.font13black700Weight),
                              ]),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Sunday , 12 Nov 2023",
                          style: TextStyles.font13Icongrey400Weight,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text("Returned Products",
                    style: TextStyles.font15Black700Weight),
                SizedBox(
                  height: 15.h,
                ),
                CustomProductsInOrderDetails(
                  count: 2,
                ),
                SizedBox(height: 10.h),
                CustomProductsInOrderDetails(
                  count: 5,
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
                Text("Return Reason", style: TextStyles.font15Black700Weight),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xff0000000D),
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                            blurRadius: 48)
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: TextStyles.font13Icongrey400Weight),
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
                Text("Attachments", style: TextStyles.font15Black700Weight),
                SizedBox(
                  height: 10.h,
                ),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      Image.asset("assets/images/return_order_image.png",
                          width: 150.w, height: 120.h),
                      Image.asset("assets/images/return_order_image.png",
                          width: 150.w, height: 120.h),
                    ],
                  ),
                )
              ]);
          ;
          ;
        }))));
  }
}

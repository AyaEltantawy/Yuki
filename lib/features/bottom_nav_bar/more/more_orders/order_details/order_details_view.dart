import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/custom_address_details.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/core/shared_widgets/custom_row.dart';
import 'package:yuki/features/bottom_nav_bar/more/more_orders/order_tracking/order_tracking_view.dart';
import 'order_details_cubit.dart';
import 'order_details_state.dart';
import 'widgets/custom_products_in_order_details.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, this.orderStatus, this.firstButtonText, this.secondButtonText, this.onPressed});

  final String? orderStatus;
  final String? firstButtonText;

  final String? secondButtonText;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OrderDetailsCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
            builder: (context, state) {
              final controller = BlocProvider.of<OrderDetailsCubit>(context);
              return ListView(children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          "Order Details",
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
                                top: 20.h,
                                bottom: 20.h,
                                end: 170.w,
                                start: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: "Order no. : ",
                                      style:
                                          TextStyles.font13Icongrey400Weight,
                                      children: [
                                        TextSpan(
                                            text: "#46679797",
                                            style: TextStyles
                                                .font13black700Weight),
                                      ]),
                                ),
                                SizedBox(height: 10.h),
                                RichText(
                                  text: TextSpan(
                                      text: "Order Status : ",
                                      style:
                                          TextStyles.font13Icongrey400Weight,
                                      children: [
                                        TextSpan(
                                            text:orderStatus?? "In Review",
                                            style: TextStyles
                                                .font13black700Weight),
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
                        Text("Products",
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
                        Divider(
                          thickness: 1,
                          color: ColorsManager.bordergrey,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text("Payment Method",
                            style: TextStyles.font15Black700Weight),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: ColorsManager.grey,
                              borderRadius: BorderRadius.circular(10.sp)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        text: "Payemnt Method :\n\n",
                                        style:
                                            TextStyles.font13Icongrey400Weight,
                                        children: [
                                      TextSpan(
                                          text: "By Credit Card",
                                          style:
                                              TextStyles.font13Black400Weight)
                                    ])),
                                Image.asset("assets/images/visa.png")
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Divider(
                          thickness: 1,
                          color: ColorsManager.bordergrey,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text("Delivery Address",
                            style: TextStyles.font15Black700Weight),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomAddressDetails(
                          radius: 10,
                          addressName: "Home,\n",
                          containerColor: ColorsManager.grey,
                        ),
                      ]),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                              color: ColorsManager.mainblue, width: 1),
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, -2),
                              blurRadius: 48,
                              spreadRadius: 0,
                              color: Color(0xff0000000D))
                        ]),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order Summary",
                              style: TextStyles.font15Secondblack700Weight,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomRow(title: "No. Of Products", amount: 7),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomRow(title: "Price", amount: 810.00),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomRow(title: "Discount Coupon Value", amount: 100.00),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomRow(title: "Tax", amount: 32.00),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomRow(title: "Delivery Expenses", amount: 20.00),
                            SizedBox(height: 10.h),
                            CustomRow(title: "Total Price", amount: 762.00),
                            SizedBox(
                              height: 20.h,
                            ),
                            Divider(
                              thickness: 1,
                              color: ColorsManager.bordergrey,
                            ),

                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              children: [
                               Expanded(
                                    child:
                                    CustomButton(onPressed:onPressed?? (){

                                      MagicRouter.navigateTo(OrderTrackingPage());},
                                        child: Text(
                                      firstButtonText??  "Track",
                                          style: TextStyles.font13White700Weight,
                                        ))
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),

                                    Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: ColorsManager.red)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 14.h),
                                      child: Text(
                                     secondButtonText??   "Cancel order",
                                        style: TextStyles.font13Secondred700Weight,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )

                              ],
                            )
                          ],
                        ))),

              ]);
            },
          ),
        ),
      ),
    );
  }
}

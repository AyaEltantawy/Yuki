import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/category_container.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/shared_widgets/show_dialog.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/core/shared_widgets/custom_row.dart';
import 'package:yuki/features/bottom_nav_bar/more/payment/widgets/custom_checkbox_and_text.dart';

import 'payment_cubit.dart';
import 'payment_state.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PaymentCubit(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(top: 20.h),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/back_arow.png"),
                    SvgPicture.asset(
                      "assets/svgs/logo.svg",
                      width: 50.w,
                      height: 50.w,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Complete Payment",
                  style: TextStyles.font20black700Weight,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Complete the payment process to confirm your order.",
                  style: TextStyles.font15Thirdgrey300Weight,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const Divider(
                  thickness: 1,
                  color: ColorsManager.mainblue,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset("assets/svgs/address_icon.svg"),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Select Delivery Address",
                          style: TextStyles.font10Secondblack700Weight,
                        ),
                      ],
                    ),
                    SvgPicture.asset("assets/svgs/cutted_line.svg"),
                    Column(
                      children: [
                        SvgPicture.asset("assets/svgs/pallet.svg"),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Complete Payment",
                          style: TextStyles.font10Black400Weight,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Choose Payment Method",
                  style: TextStyles.font16Black700Weight,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomCheckboxAndText(
                paymentMethodName: 'Cash on delivery',
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomCheckboxAndText(
                paymentMethodName: 'instapay',
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomCheckboxAndText(
                paymentMethodName: 'vodafone cash',
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const Divider(
                  thickness: 1,
                  color: ColorsManager.icongrey,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomTextFormFeild(
                        upperText: "Do you have discount coupon ?",
                        hint: "Enter Discount Coupon",
                        prefixIcon:
                            SvgPicture.asset("assets/svgs/Ticket Sale.svg"),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: CategoryContainer(
                          title: "Apply",
                          isSelected: true,
                          horizontal: 20.w,
                          vertical: 13.h,
                          radius: 5),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: ColorsManager.mainblue, width: 1),
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
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
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
                        CustomRow(title: "Tax", amount: 32.00),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomRow(title: "shipping fees", amount: 20.00),
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
                        CustomButton(
                            child: Text(
                              "Checkout",
                              style: TextStyles.font16White700Weight,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => ResetPasswordDialog(
                                  mainText:
                                      "Your order has been successfully placed and is now in review.",
                                  defaultText:
                                      "Thank you for shopping with us.",
                                ),
                              );
                            })
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

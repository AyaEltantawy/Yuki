import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/address_card.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

import '../../more/payment/payment_view.dart';
import 'select_delivery_address_cubit.dart';
import 'select_delivery_address_state.dart';

class SelectdeliveryaddressPage extends StatelessWidget {
  const SelectdeliveryaddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SelectdeliveryaddressCubit(),
        child: Scaffold(
          body: SafeArea(
              child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            children: [
              Row(
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
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Select Delivery Address",
                style: TextStyles.font20black700Weight,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Choose the address you want your order to be delivered to.",
                style: TextStyles.font15Thirdgrey300Weight,
              ),
              Divider(
                thickness: 1,
                color: ColorsManager.mainblue,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
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
              SizedBox(
                height: 20.h,
              ),
              AddressCard(
                border: Border.all(width: 1, color: ColorsManager.mainblue),
                addressName: "Home",
                choose: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              AddressCard(
                addressName: "Work",
                choose: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              AddressCard(
                addressName: "Office",
                choose: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/svgs/add_blue_icon.svg"),
                    SizedBox(width: 10.h),
                    Text(
                      "Add New Address",
                      style: TextStyles.font14Mainblue700Weight,
                    )
                  ],
                ),
              ),
              CustomButton(
                child: Text(
                  "Continue to checkout",
                  style: TextStyles.font16White700Weight,
                ),
                onPressed: () {
                  MagicRouter.navigateTo(PaymentPage());
                },
              )
            ],
          )),
        ));
  }
}

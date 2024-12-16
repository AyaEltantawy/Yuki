import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/bottom_nav_bar/more/discount_coupons/widgets/custom_discount_coupons.dart';
import 'discount_coupons_cubit.dart';

class DiscountCouponsPage extends StatelessWidget {
  const DiscountCouponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => DiscountCouponsCubit(),
        child: Scaffold(
            body: SafeArea(
                child: ListView(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
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
                "Discount Coupons",
                style: TextStyles.font20black700Weight,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Use discount coupons and get discounts on your purchases",
                style: TextStyles.font15Thirdgrey300Weight,
              ),
              const Divider(
                thickness: 1,
                color: ColorsManager.mainblue,
              ),
              SizedBox(
                height: 20.h,
              ),
              const CustomDiscountCoupons(),
              SizedBox(
                height: 10.h,
              ),
              const CustomDiscountCoupons(),
              SizedBox(
                height: 10.h,
              ),
              const CustomDiscountCoupons(),
              SizedBox(
                height: 10.h,
              ),
              const CustomDiscountCoupons(),
              SizedBox(
                height: 10.h,
              ),
              const CustomDiscountCoupons(),
              SizedBox(
                height: 10.h,
              ),
            ]))));
  }
}

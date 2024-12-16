import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class CustomDiscountCoupons extends StatelessWidget {
  final String? value;
  final String? type;

  const CustomDiscountCoupons({super.key, this.value, this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: ColorsManager.grey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20),
            child: SvgPicture.asset(
              "assets/svgs/logo.svg",
              width: 70.w,
              height: 70.w,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              color: ColorsManager.grey,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              border: Border(
                  left: BorderSide(
                    width: 1,
                    color: ColorsManager.thirdblue,
                  ),
                  bottom: BorderSide.none)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 29.9.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value ?? '',
                      style: TextStyles.font16Mainblue700Weight,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      type ?? '',
                      style: TextStyles.font14Black700Weight,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Valid until May 2024",
                      style: TextStyles.font12Black400Weight,
                    )
                  ],
                ),
                SizedBox(
                  width: 44.w,
                ),
                SvgPicture.asset("assets/svgs/Copy.svg")
              ],
            ),
          ),
        )
      ],
    );
  }
}

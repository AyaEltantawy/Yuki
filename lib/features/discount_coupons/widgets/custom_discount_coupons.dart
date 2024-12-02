import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class CustomDiscountCoupons extends StatelessWidget {
  const CustomDiscountCoupons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: ColorsManager.grey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h,horizontal: 20),
            child: SvgPicture.asset(
              "assets/svgs/logo.svg",
              width: 70.w,
              height: 70.w,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: ColorsManager.grey,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
            border: Border(left: BorderSide(width: 1,color: ColorsManager.thirdblue,),bottom: BorderSide.none)
          ),
child: Padding(
  padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 29.9.h),
  child: Row(crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
  Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

  Text("5.00",style: TextStyles.font16Mainblue700Weight,),
    SizedBox(height: 15.h,),
    Text("First 5",style: TextStyles.font14Black700Weight,),
      SizedBox(height: 15.h,),
      Text("Valid until May 2024",style: TextStyles.font12Black400Weight,)

  ],),
SizedBox(width: 44.w,),
SvgPicture.asset("assets/svgs/Copy.svg")


    ],
  ),
),


        )
      ],
    );
  }
}

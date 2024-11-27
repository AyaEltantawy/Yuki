import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:yuki/core/shared_widgets/review_bottom_sheet.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class CustomCustomerReviews extends StatelessWidget {
  const CustomCustomerReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 40,
                spreadRadius: 0,
                offset: Offset(0, 4),
                color: Color(0x25252514))
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/first_reviewer.png"),
            SizedBox(width: 10.w),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mai Salah",
                        style: TextStyles.font13black700Weight,
                      ),
                      // SizedBox(
                      //   width: 150.w,
                      // ),
                      Row(
                        children: [
                          Text(
                            "5.0",
                            style: TextStyles.font11black400Weight,
                          ),
                          GestureDetector(
                              onTap:(){showMaterialModalBottomSheet(context: context,
                              builder: (context) => ReviewBottomSheet());},child: SvgPicture.asset("assets/svgs/stare_of_rate.svg")),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices lacinia nunc. Aliquam erat vo",
                    style: TextStyles.font12Fourthgrey300Weight,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
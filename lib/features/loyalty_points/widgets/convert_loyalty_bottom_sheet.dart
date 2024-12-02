import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class ConvertLoyaltyBottomSheet extends StatelessWidget {
  const ConvertLoyaltyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: SafeArea(
          child: ListView(shrinkWrap: true, children: [
        Container(
          decoration: const BoxDecoration(
              color: ColorsManager.grey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Divider(
                indent: 135,
                endIndent: 135,
                thickness: 3,
                color: ColorsManager.fivegrey,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Text(
                  "Convert Loyalty Points",
                  style: TextStyles.font15Black700Weight,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Text(
                  "Convert loyalty points to wallet balcnce",
                  style: TextStyles.font13Textgrey300Weight,
                ),
              )
            ]),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Loyalty Poitns",
                style: TextStyles.font15Icongrey400Weight,
              ),
              Text(
                "10000 Loyalty point",
                style: TextStyles.font15Black700Weight,
              )
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomButton(
              child: Text(
            "Convert to wallet balance",
            style: TextStyles.font16White700Weight,
          )),
        ),
        SizedBox(
          height: 20.h,
        ),
      ])),
    );
  }
}

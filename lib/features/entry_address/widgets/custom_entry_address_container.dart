import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class CustomEntryAddressContainer extends StatelessWidget {
  final bool isSelected;
  final String text;
final VoidCallback onTap;
  const CustomEntryAddressContainer(
      {super.key, required this.isSelected, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? ColorsManager.mainblue : ColorsManager.grey,
            borderRadius: BorderRadius.circular(5),
            // boxShadow: const [
            //   BoxShadow(
            //
            //       blurRadius: 25,
            //       spreadRadius: 0,
            //       offset: Offset(0, 0),
            //       color: Color(0xff1312120A))
            // ]
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 40.w,vertical: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSelected
                  ? SvgPicture.asset("assets/svgs/address_icon_white.svg")
                  : SvgPicture.asset(
                      "assets/svgs/address_icon_without_background.svg"),
              SizedBox(
                width: 10.w,
              ),
              Text(text,style: isSelected? TextStyles.font13White700Weight:TextStyles.font13Secondaryblue400Weight,)
            ],
          ),
        ),
      ),
    );
  }
}

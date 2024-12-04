import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/theming/styles.dart';

class CustomAddressDetails extends StatelessWidget {

  const CustomAddressDetails({super.key, this.containerColor, this.radius, this.addressName});
final Color? containerColor;
final double? radius;
final String? addressName;
  @override
  Widget build(BuildContext context) {

    return  Container(
      decoration: BoxDecoration(
          color: containerColor?? Colors.white,
          borderRadius: BorderRadius.circular(radius?? 5)),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            top: 20.h,
            end: 40.w,
            bottom: 20.h,
            start: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SvgPicture.asset(
                "assets/svgs/address_icon_without_background.svg"),
            SizedBox(
              width: 10.w,
            ),
            Flexible(
              child: RichText(
                maxLines: 3,
                text: TextSpan(
                  text:addressName?? "Mansoura,\n",
                  style: TextStyles.font13Black400Weight,
                  children: [
                    TextSpan(
                        text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                        style: TextStyles
                            .font13Icongrey300Weight)
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );


  }
}

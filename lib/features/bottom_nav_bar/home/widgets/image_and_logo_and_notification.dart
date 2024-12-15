import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
class ImageAndLogoAndNotification extends StatelessWidget {
  const ImageAndLogoAndNotification({super.key,  this.onTapOnNotification});
final VoidCallback? onTapOnNotification;
  @override
  Widget build(BuildContext context) {

    return   Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 45.h,
          width: 45.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: AssetImage(
                  'assets/images/girl_photo_in_home.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SvgPicture.asset(
          "assets/svgs/logo.svg",
          width: 45.w,
          height: 45.h,
        ),
        InkWell(onTap: onTapOnNotification,
          child: badges.Badge(
            position: badges.BadgePosition.topEnd(
                top: -4, end: 1),
            child: SvgPicture.asset(
              "assets/svgs/notify.svg",
              width: 45.w,
              height: 45.h,
            ),
          ),
        ),
      ],
    );
  }
}

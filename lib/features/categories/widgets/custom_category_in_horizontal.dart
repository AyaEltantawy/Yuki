import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class CustomCategoryInHorizontal extends StatelessWidget {
  const CustomCategoryInHorizontal(
      {super.key,
      required this.imageUrl,
      required this.categoryName,
      required this.categoryCount, this.onTap});

  final String imageUrl;
  final String categoryName;

  final int categoryCount;
final   VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,


      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 40.sp,
              backgroundImage:  CachedNetworkImageProvider(
                 imageUrl
              ),
            ),

        SizedBox(width: 25.w,),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryName,
              style: TextStyles.font15Black700Weight,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "$categoryCount",
              style: TextStyles.font13Textgrey400Weight,
            )
          ],
        ), ],
        ),

        InkWell(onTap: onTap,
          child: Container(
              width: 45.w,
              height: 45.w,
              decoration: BoxDecoration(
                  color: ColorsManager.grey,
                  borderRadius: BorderRadius.circular(40)),
              child: const Icon(Icons.arrow_forward_outlined,
                  color: ColorsManager.mainblue)),
        ),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import '';

class CustomCategory extends StatelessWidget {
  CustomCategory({
    super.key,
    required this.categoryName,
    required this.categoryCount,
    required this.imageUrl,
  });

  final String categoryName;

  final int categoryCount;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: CachedNetworkImageProvider(imageUrl),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          categoryName,
          style: TextStyles.font15Black700Weight,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          " $categoryCount",
          style: TextStyles.font13Textgrey400Weight,
        )
      ],
    );
  }
}

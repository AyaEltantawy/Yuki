

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class CustomMore extends StatelessWidget {
  const CustomMore({super.key, required this.imageUrl, required this.title, required this.onPressed});
final String imageUrl;
final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SvgPicture.asset(imageUrl),
        SizedBox(width: 20.w),
        Expanded(child: Text(title,style: TextStyles.font15Black400Weight,)),

        IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_forward,color: ColorsManager.mainblue,))
      ],
    );














  }
}

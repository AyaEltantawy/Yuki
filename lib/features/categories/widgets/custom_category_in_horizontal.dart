import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class CustomCategoryInHorizontal extends StatelessWidget {
  const CustomCategoryInHorizontal({super.key, required this.imageUrl, required this.categoryName, required this.categoryCount});

  final String imageUrl;
  final String categoryName;

  final String categoryCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: 80.w,
            height: 80.w,
            decoration: const BoxDecoration(
                // gradient: LinearGradient(
                //   colors: [
                //     Color(0xff020659),
                //     Color(0xff031780),
                //   ],
                //     begin: Alignment.centerLeft,
                //     end: Alignment.centerRight,
                //     stops: [0.14, 0.4]),

                shape: BoxShape.circle,
                color: ColorsManager.mainblue),
            child: Image.asset(imageUrl)),
        SizedBox(width: 20.w,),
        Column(

          children: [
            Text(
              categoryName,
              style: TextStyles.font15Black700Weight,
            ),
SizedBox(height: 20.h,),
            Text(categoryCount,style: TextStyles.font13Textgrey400Weight,)
          ],
        ),
        SizedBox(width:100.w,),
        Container(
            width: 45.w,
            height: 45.w,
            decoration: BoxDecoration(
                color: ColorsManager.grey,
                borderRadius: BorderRadius.circular(40)),
            child: const Icon(Icons.arrow_forward_outlined,
                color: ColorsManager.mainblue)),
      ],
    );
  }
}

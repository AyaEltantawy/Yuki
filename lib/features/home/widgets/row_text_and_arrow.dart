import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class RowTextAndArrow extends StatelessWidget {
 final String title;
 final String description;
 RowTextAndArrow({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {

    return     Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyles
                    .font15Secondblack700Weight),
            SizedBox(
              height: 5.h,
            ),
            Text(description,
                style: TextStyles
                    .font12Textgrey400Weight)
          ],
        ),
        Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
                color: ColorsManager.grey,
                borderRadius:
                BorderRadius.circular(40)),
            child: const Icon(
                Icons.arrow_forward_outlined,
                color: ColorsManager.mainblue)),
      ],
    );
  }
}

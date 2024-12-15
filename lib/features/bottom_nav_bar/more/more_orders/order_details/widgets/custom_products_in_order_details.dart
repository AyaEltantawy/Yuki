import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class CustomProductsInOrderDetails extends StatelessWidget {
  CustomProductsInOrderDetails({super.key, this.count});

  final int? count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: ColorsManager.seconderyblue,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    spreadRadius: 0, blurRadius: 48, color: Color(0x0000000D))
              ]),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 35.h),
            child: Text("${count}x",style:TextStyles.Font20White500Weight),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: ColorsManager.grey,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 48,
                    spreadRadius: 0,
                    color: Color(0x0000000D),
                    offset: Offset(0, 2),
                    blurStyle: BlurStyle.outer,
                  )
                ]),
            child: Padding(
              padding: EdgeInsets.only(left: 7, top: 5.h, bottom: 5.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/spray_card.png"),
                  SizedBox(
                    width: 10.w,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("rosemairy shaghgsh",
                            style: TextStyles.font16Black700Weight),
                        SizedBox(
                          height: 10.h,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Price :",
                                style: TextStyles.font13Black400Weight,
                                children: [
                              TextSpan(
                                  text: " 360.00",
                                  style: TextStyles.font13Mainblue700Weight),
                            ])),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

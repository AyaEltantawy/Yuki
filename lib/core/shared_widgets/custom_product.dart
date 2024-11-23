import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 168.w,
      // height: 260.h,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: ColorsManager.grey),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                "assets/images/spray.png",
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 167.w,
                height: 116.h,
                decoration: const BoxDecoration(
                    color: ColorsManager.grey,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("keratin serum",
                              style: TextStyles.font14Black700Weight),
                          const Icon(Icons.favorite_border,
                              color: ColorsManager.secondred)
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text: "Price:",
                            style: TextStyles.font13Black400Weight,
                            children: [
                              TextSpan(
                                  text: " 180.00",
                                  style: TextStyles.font13Icongrey700Weight
                                      .copyWith(
                                          decoration:
                                              TextDecoration.lineThrough)),
                              TextSpan(
                                  text: " 150",
                                  style: TextStyles.font13Mainblue700Weight)
                            ]),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 88.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: ColorsManager.textgrey,
                                ),
                                Text("1"),
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: ColorsManager.mainblue,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Image.asset("assets/images/market_icon.png",
                              width: 47.w, height: 32.h)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 10.w,
            bottom: 125.h,
            child: Container(
              width: 52.w,
              height: 25.h,
              decoration: BoxDecoration(
                  color: ColorsManager.secondred,
                  borderRadius: BorderRadius.circular(3)),
              child: Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Text(
                  textAlign: TextAlign.center,
                  "10% Off",
                  style: TextStyles.font11white400Weight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

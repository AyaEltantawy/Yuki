import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class CustomProduct extends StatelessWidget {
  CustomProduct(
      {super.key,
      required this.productName,
      required this.imageUrl,
      this.previosPrice,
      required this.currentPrice, required this.offerState});

  bool isFavourite = false;
  int count = 1;

  void increament() {
    count++;
  }

  void decreament() {
    if (count > 1) {
      count--;
    }
  }

  final String productName;
  final String imageUrl;
  late final double? previosPrice;
  final double currentPrice;
final   String offerState;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 178.w,
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
                imageUrl,
                width: 122.w,height: 122.w,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 177.w,
                height: 121.3.h,
                decoration: const BoxDecoration(
                    color: ColorsManager.grey,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(productName,
                              style: TextStyles.font14Black700Weight),
                          StatefulBuilder(builder: (BuildContext context,
                              void Function(void Function()) setState) {
                            return IconButton(
                              icon: isFavourite == false
                                  ? const Icon(
                                      Icons.favorite_border,
                                      color: ColorsManager.secondred,
                                      size: 23,
                                    )
                                  : const Icon(
                                      Icons.favorite,
                                      color: ColorsManager.secondred,
                                      size: 23,
                                    ),
                              onPressed: () {
                                setState(() {
                                  isFavourite = !isFavourite;
                                });
                              },
                            );
                          }),
                        ],
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text: "Price:",
                            style: TextStyles.font13Black400Weight,
                            children: [
                              TextSpan(
                                  text: "${previosPrice ?? ""} ",
                                  style:previosPrice != null ? TextStyles.font13Icongrey700Weight
                                      .copyWith(
                                          decoration:
                                              TextDecoration.lineThrough)
                              :TextStyles.font13Icongrey700Weight
                                      .copyWith(
                                      decoration:
                                      TextDecoration.none)),
                              TextSpan(
                                  text: "$currentPrice",
                                  style: TextStyles.font13Mainblue700Weight)
                            ]),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 109.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: StatefulBuilder(
                              builder: (BuildContext context,
                                  void Function(void Function()) setState) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 17,
                                      ),
                                      color: ColorsManager.textgrey,
                                      onPressed: () {
                                        setState(() {
                                          decreament();
                                        });
                                      },
                                    ),
                                    //SizedBox(width: 5,),
                                    Text("$count"),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        size: 17,
                                      ),
                                      color: ColorsManager.mainblue,
                                      onPressed: () {
                                        setState(() {
                                          increament();
                                        });
                                      },
                                    ),
                                    //SizedBox(width: 5,),
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
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
                  offerState,
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

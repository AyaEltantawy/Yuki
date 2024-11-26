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
      required this.currentPrice,
      required this.offerState, required this.onTap});

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
  final String offerState;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Container(
        //width: 178.w,
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
                  width: 122.w,
                  height: 122.w,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: ColorsManager.grey,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
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
                                        size: 17,
                                      )
                                    : const Icon(
                                        Icons.favorite,
                                        color: ColorsManager.secondred,
                                        size: 17,
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
                                    style: previosPrice != null
                                        ? TextStyles.font13Icongrey700Weight
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough)
                                        : TextStyles.font13Icongrey700Weight
                                            .copyWith(
                                                decoration: TextDecoration.none)),
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
                    Container( height: 32,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                      child: StatefulBuilder(
                        builder: (BuildContext context,
                            void Function(void Function()) setState) {
                          return Row(
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
                            SizedBox(width: 2.w,),
                            Image.asset("assets/images/market_icon.png",
                                width: 35.w, height: 32.h)
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
              bottom: 170.h,
              child: Container(
                decoration: BoxDecoration(
                    color: ColorsManager.secondred,
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
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
      ),
    );
  }
}

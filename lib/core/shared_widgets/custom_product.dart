import 'package:cached_network_image/cached_network_image.dart';
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
      required this.offerState,
      required this.onTap,
      required this.onTapFavorite,
      this.isFavourite,required this.count,required this.increament,required this.decreament,this.onTapMarket });

  bool? isFavourite;

 int count ;
 void Function() increament ;
 void Function( )decreament;
  final VoidCallback onTapFavorite;
  final VoidCallback? onTapMarket;




  final String productName;
  final String imageUrl;
  late final num? previosPrice;
  final num currentPrice;
  final String offerState;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 175.w,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: ColorsManager.grey),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: Column(
          children: [
            Stack(children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0.h),
                child: CachedNetworkImage(
                  width: 135.w,
                  height: 122.w,
                  imageUrl: imageUrl,
                ),
              ),
              Positioned(
                right: 0.w,
                bottom: 0.h,
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorsManager.secondred,
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      offerState,
                      maxLines: 2,
                      style: TextStyles.font11white400Weight,
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(height: 10.h),
            Container(
              decoration: const BoxDecoration(
                  color: ColorsManager.grey,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(productName,
                            style: TextStyles.font14Black700Weight),
                        StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) setState) {
                            return InkWell(
                                onTap: onTapFavorite,
                                child: Icon(
                                  isFavourite == false
                                      ? Icons.favorite_border
                                      : Icons.favorite,
                                  color: ColorsManager.secondred,
                                ));
                          },
                        ),
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
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 32,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                          child: StatefulBuilder(
                            builder: (BuildContext context,
                                void Function(void Function()) setState) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      child: const Icon(
                                        Icons.remove,
                                        size: 17,
                                        color: ColorsManager.textgrey,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          decreament();
                                        });
                                      },
                                    ),

                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Text("$count"),
                                    ),

                                    InkWell(
                                      child: const Icon(
                                        Icons.add,
                                        size: 17,
                                        color: ColorsManager.mainblue,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          increament();
                                        });
                                      },
                                    ),
                                    //SizedBox(width: 5,),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                       InkWell(
                         onTap: onTapMarket,
                          child: Image.asset("assets/images/market_icon.png",
                              width: 45.w, height: 45.h),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

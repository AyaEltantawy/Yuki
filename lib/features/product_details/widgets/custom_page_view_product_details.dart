import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/theming/colors.dart';

class CustomPageViewProductDetails extends StatelessWidget {
  CustomPageViewProductDetails({
    super.key,
    required this.onPageChanged,
    required this.imageUrl,
   required this. currentPage,
    required this.onTapRight, required this.onTapLeft, required this.pageController,
    this.
  item
  });

  final void Function(int)? onPageChanged;
  final String imageUrl;
  final int currentPage;
final PageController pageController;
final VoidCallback onTapRight;
final VoidCallback onTapLeft;

  List<Widget>? item ;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 260.h,
          child: PageView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount:imageUrl.length,
            controller: pageController,

            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {

              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: const Border.symmetric(
                        horizontal: BorderSide(width: 1, color: Color(0xff031780))
                    ),
                    borderRadius: BorderRadius.circular(30)

                ),
                child: CachedNetworkImage(imageUrl: imageUrl,fit: BoxFit.contain,)

              );
            },
          ),
        ),
        buildCarouselIndicator(),
        Positioned(
          left: 20.w,
          top: 30.h,
          bottom: 20.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i <( item?.length??4); i++)
                Container(
                    width: 45.w,
                    height: 45.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 0.5,
                            color: currentPage == i
                                ? ColorsManager.mainblue
                                : ColorsManager.bordergrey)),
                    child: item?[i]),
            ],
          ),
        ),
        Positioned(
            right: 20.w,
            bottom: 20.h,
            top: 20.h,
            child: GestureDetector(onTap: onTapRight,
                child: SvgPicture.asset("assets/svgs/arrow_next.svg"))),
        Positioned(
            left: 20.w,
            bottom: 20.h,
            top: 20.h,
            child: GestureDetector(onTap: onTapLeft,
                child: SvgPicture.asset("assets/svgs/Round Alt Arrow Left.svg")))
      ],
    );
  }

  buildCarouselIndicator() {
    return Positioned(
      bottom: 7.h,
      right: 10.w,
      left: 10.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i <( item?.length??4); i++)
            Container(
              margin: const EdgeInsets.all(5),
              height: 8.w,
              width: 8.h,
              decoration: BoxDecoration(
                  color: i == currentPage
                      ? ColorsManager.mainblue
                      : Colors.black.withOpacity(.2),
                  shape: BoxShape.circle),
            ),
        ],
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCarousalSliderHome extends StatelessWidget {
  const CustomCarousalSliderHome(
      {super.key,
      required this.onPageChanged,
      required this.items,
      this.currentPage, required this.autoPlay});

  final Function(int, CarouselPageChangedReason) onPageChanged;
  final List<Widget> items;
  final int? currentPage;
  final bool autoPlay;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: autoPlay,
              height: 163.h,
              viewportFraction: 1,
              initialPage: 0,
              onPageChanged: onPageChanged),
          items: items,
        ),
        if (currentPage != null) buildCarouselIndicator(),
        Positioned(
          bottom: 10,
          left: 10,
          child: SvgPicture.asset("assets/svgs/logo.svg"),
        )
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
          for (int i = 0; i < items.length; i++)
            Container(
              margin: const EdgeInsets.all(5),
              height: 8.w,
              width: 8.h,
              decoration: BoxDecoration(
                  color: i == currentPage
                      ? Colors.white
                      : Colors.white.withOpacity(.5),
                  shape: BoxShape.circle),
            ),
        ],
      ),
    );
  }
}

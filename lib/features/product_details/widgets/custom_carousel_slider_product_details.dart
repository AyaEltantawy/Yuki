import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/theming/colors.dart';

class CustomCarousalSliderProduct extends StatelessWidget {
  CustomCarousalSliderProduct({
    super.key,
    required this.onPageChanged,
    required this.items,
    this.currentPage,
    required this.autoPlay, required this.onTapRight, required this.onTapLeft,
  });

  final Function(int, CarouselPageChangedReason) onPageChanged;
  final List<Widget> items;
  final int? currentPage;
  final bool autoPlay;
final VoidCallback onTapRight;
final VoidCallback onTapLeft;
  int i = 0;
  List<Widget> item = [
    Image.network(
      "https://s3-alpha-sig.figma.com/img/04a4/c2e3/0012e3b75ed7e59393eba31e16846530?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Vi6vVNhyp0ntOvArdii11tqMvlb~fvoMDszkqUSsR2Le~1tqIW-xLg9seIZIYIZtxf3dEBBoTJYKUE2KCRhVbgYB9fCXLbF3QxN5Xinjc13cIIGgChkncIIjpnEt9hXM3A~uDrzg6HyTPbcJ~2PmDb0N2pK5Fi-yXh6J4rQkNWh3JHRstodFdPaQAZ43xW1fwfPTC~J3G7u~f5RKDqI6n3IMm3fP9YMM9BEpn9mNOx2gT0k3qbFIsCS00aRz3g-hDQL8TflWkb-7GM5wMHM7dkqA1OnSoD0YM5WC~DWIua1S1IURJtFw78Ygjs~A4YFNVqZxpRNyOMQ~LQldRCqaCQ__",
      fit: BoxFit.fill,
    ),
    Image.network(
      "https://s3-alpha-sig.figma.com/img/236e/b780/769eca1a5c4de842955b119656de90bb?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Ic~aum9x5JFcOVdHnONHLJ7260HNgQeLBmd4gyMC9BeOGnf7LqEgBXRr0YYPqOuVAunu2SodL5jcLXLB9ItVjrvL0i4NczP7~tAU~22580cmff0SUZdvsPCj5qprruOfzLsCUg9APCP4lLkiWXSmcHUzocXwgKxISR9icF7S0cpfdOj2kwKc~fTMldKCKLGoMZDrzJ-xy1gdtg52qlwrUBM8aGDLJbOoaoMiu3Pxk-qe9tK8IgBY0O8NWLLuMOPAC8Lyp7o8LyQ-g3DdTb7TLt63bSlAyckXJtb31B-gLKeA4WeU6gNJN7Ja0dUELPOyimVkJUKdlRkqM4lGA6cQ9w__",
      fit: BoxFit.fill,
    ),
    Image.network(
      "https://s3-alpha-sig.figma.com/img/236e/b780/769eca1a5c4de842955b119656de90bb?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Ic~aum9x5JFcOVdHnONHLJ7260HNgQeLBmd4gyMC9BeOGnf7LqEgBXRr0YYPqOuVAunu2SodL5jcLXLB9ItVjrvL0i4NczP7~tAU~22580cmff0SUZdvsPCj5qprruOfzLsCUg9APCP4lLkiWXSmcHUzocXwgKxISR9icF7S0cpfdOj2kwKc~fTMldKCKLGoMZDrzJ-xy1gdtg52qlwrUBM8aGDLJbOoaoMiu3Pxk-qe9tK8IgBY0O8NWLLuMOPAC8Lyp7o8LyQ-g3DdTb7TLt63bSlAyckXJtb31B-gLKeA4WeU6gNJN7Ja0dUELPOyimVkJUKdlRkqM4lGA6cQ9w__",
      fit: BoxFit.fill,
    ),
    Image.network(
      "https://s3-alpha-sig.figma.com/img/236e/b780/769eca1a5c4de842955b119656de90bb?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Ic~aum9x5JFcOVdHnONHLJ7260HNgQeLBmd4gyMC9BeOGnf7LqEgBXRr0YYPqOuVAunu2SodL5jcLXLB9ItVjrvL0i4NczP7~tAU~22580cmff0SUZdvsPCj5qprruOfzLsCUg9APCP4lLkiWXSmcHUzocXwgKxISR9icF7S0cpfdOj2kwKc~fTMldKCKLGoMZDrzJ-xy1gdtg52qlwrUBM8aGDLJbOoaoMiu3Pxk-qe9tK8IgBY0O8NWLLuMOPAC8Lyp7o8LyQ-g3DdTb7TLt63bSlAyckXJtb31B-gLKeA4WeU6gNJN7Ja0dUELPOyimVkJUKdlRkqM4lGA6cQ9w__",
      fit: BoxFit.fill,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(key: key,

          options: CarouselOptions(
              autoPlay: autoPlay,
              height: 260.h,
              viewportFraction: 1,
              initialPage: 0,
              onPageChanged: onPageChanged),
          items: items,
        ),
        buildCarouselIndicator(),
        Positioned(
          left: 20.w,
          top: 30.h,
          bottom: 20.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < items.length; i++)
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
                    child: item[i]),
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
          for (int i = 0; i < items.length; i++)
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

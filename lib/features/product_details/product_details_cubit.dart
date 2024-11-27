import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/theming/colors.dart';

import 'package:yuki/features/product_details/product_details_state.dart';



class ProductdetailsCubit extends Cubit<ProductdetailsState> {

  ProductdetailsCubit() : super(ProductdetailsStateInit());
bool onPress = false;
  int currentPage = 0;
  List<Widget> items = [

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
                      : ColorsManager.black.withOpacity(.3),
                  shape: BoxShape.circle),
            ),
        ],
      ),
    );
  }
  void updateIndicator(value) {
    currentPage = value;

    emit(BuildCarouselIndicator());
  }
  bool isSelected = false;
updatContainerOnStack(value){

  currentPage = value;
  emit(UdatContainerOnStack());

}int value =0;
  updateArrowRight(value) {
    onPress = !onPress;
// currentPage=value;
    emit(UpdateArrowRight());
  }
  int count = 1;

  void increament() {
    count++;
    emit(UpdateIncrement());
  }

  void decreament() {
    if (count > 1) {
      count--;
      emit(UpdateDecrement());
    }
  }
     }

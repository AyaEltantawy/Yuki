import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/features/product_details/widgets/custom_carousel_slider_product_details.dart';

import 'product_details_cubit.dart';
import 'product_details_state.dart';

class ProductdetailsPage extends StatelessWidget {


  const ProductdetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ProductdetailsCubit(),
        child: Scaffold(body: SafeArea(
          child: BlocBuilder<ProductdetailsCubit, ProductdetailsState>(
              builder: (context, state) {
            final controller = BlocProvider.of<ProductdetailsCubit>(context);
            return ListView(
//padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/back_arow.png"),
                      SvgPicture.asset(
                        "assets/svgs/logo.svg",
                        width: 50.w,
                        height: 50.w,
                      )
                    ],
                  ),
                ),
                CustomCarousalSliderProduct(
                  items: controller.items
                      .map((e) => Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      width: 1, color: Color(0xff031780))),
                              borderRadius: BorderRadius.circular(30)),
                          child: e))
                      .toList(),
                  onPageChanged: (value, _) {
                    controller.updateIndicator(value);
                    controller.updatContainerOnStack(value);

                    controller. updateArrowRight(value+1);

                  },
                  currentPage: controller.currentPage,
                  autoPlay: false,
                  onTapLeft: () {},
                  onTapRight: () {     controller. updateArrowRight(controller.value+1) ; },
                ),
              ],
            );
          }),
        )));
  }
}

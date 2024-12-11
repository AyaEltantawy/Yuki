import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/category_container.dart';
import 'package:yuki/features/product_details/widgets/custom_customer_reviews.dart';
import 'package:yuki/core/shared_widgets/get_review_bottom_sheet.dart';
import 'package:yuki/core/shared_widgets/set_review_bottom_sheet.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/product_details/widgets/custom_page_view_product_details.dart';
import 'package:yuki/features/yuki_store/yukistore_view.dart';
import 'product_details_cubit.dart';
import 'product_details_state.dart';

class ProductdetailsPage extends StatelessWidget {
  ProductdetailsPage(
      {super.key, required this.rateAmount, required this.reviewText});

  PageController controller = PageController();
  final double rateAmount;
  final String reviewText;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ProductdetailsCubit(),
        child: Scaffold(body: SafeArea(
          child: BlocBuilder<ProductdetailsCubit, ProductdetailsState>(
              builder: (context, state) {
            final cubitController =
                BlocProvider.of<ProductdetailsCubit>(context);
            return ListView(
//padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap:(){MagicRouter.navigateTo(YukistorePage(category_id: 0));},


                          child: Image.asset("assets/images/back_arow.png")),
                      SvgPicture.asset(
                        "assets/svgs/logo.svg",
                        width: 50.w,
                        height: 50.w,
                      )
                    ],
                  ),
                ),
                CustomPageViewProductDetails(
                  items: cubitController.items,
                  onPageChanged: (value) {
                    cubitController.updateIndicator(value);
                    cubitController.updatContainerOnStack(value);
                  },
                  onTapRight: () {
                    if (cubitController.currentPage >= 0 &&
                        cubitController.currentPage <
                            cubitController.items.length) ;
                    controller.jumpToPage(cubitController.currentPage + 1);
                  },
                  onTapLeft: () {
                    if (cubitController.currentPage <=
                            cubitController.items.length &&
                        cubitController.currentPage > 0) ;
                    controller.jumpToPage(cubitController.currentPage - 1);
                  },
                  currentPage: cubitController.currentPage,
                  pageController: controller,
                )

                /*  CustomCarousalSliderProduct(
                  items: controller.items
                      .map((e) => Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: const Border.symmetric(
                                  horizontal: BorderSide(
                                      width: 1, color: Color(0xff031780))),
                              borderRadius: BorderRadius.circular(30)),
                          child: e))
                      .toList(),
                  onPageChanged: (value, _) {
                    controller.updateIndicator(value);
                    controller.updatContainerOnStack(value);

                    controller.updateArrowRight(value + 1);
                  },
                  currentPage: controller.currentPage,
                  autoPlay: false,
                  onTapLeft: () {},
                  onTapRight: () {
                    controller.updateArrowRight(controller.value + 1);
                  },
                ),*/
                ,
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Deodorant White Mesk",
                  style: TextStyles.font16Black700Weight,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    thickness: 1,
                    color: ColorsManager.bordergrey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Qty :',
                        style: TextStyles.font14blackWei400ght,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorsManager.grey,
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 17,
                                  ),
                                  color: ColorsManager.textgrey,
                                  onPressed: () {
                                    cubitController.decreament();
                                  },
                                ),
                                Text("${cubitController.count}"),
                                IconButton(
                                    icon: const Icon(
                                      Icons.add,
                                      size: 17,
                                    ),
                                    color: ColorsManager.mainblue,
                                    onPressed: () {
                                      cubitController.increament();
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      CategoryContainer(
                        title: "Body Care",
                        isSelected: true,
                        horizontal: 20.w,
                        vertical: 15.h,
                        radius: 5,
                        // height: 50.h,
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    thickness: 1,
                    color: ColorsManager.bordergrey,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product Description",
                        style: TextStyles.font15Black700Weight,
                      ),
                      Text(
                        "Out of Stock",
                        style: TextStyles.font13Secondred700Weight,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Text(
                    "Experience long-lasting freshness and a delicate, captivating scent with our Deodorant White Musk. Infused with the soft, clean fragrance of white musk, this deodorant provides all-day protection against odor, .",
                    style: TextStyles.font13Black400Weight,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: CategoryContainer(
                          title: "Ingredients",
                          isSelected: true,
                          horizontal: 40.w,
                          vertical: 15.h,
                          radius: 8,
                          // height: 50.h,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Flexible(
                        child: CategoryContainer(
                          title: "How to Use",
                          isSelected: false,
                          horizontal: 40.w,
                          vertical: 15.h,
                          radius: 8,
                          // height: 50.h,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Ingredients:",
                    style: TextStyles.font15Mainblue700Weight,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: const Text("Aqua (Water)\n"
                      "Glycerin (Moisturizing agent)\n"
                      "White Musk Extract (Fragrance)\n"
                      "Aloe Vera Extract (Soothing and hydrating)\n"
                      "Sodium Bicarbonate (Odor neutralizer)\n"
                      "Potassium Alum (Natural mineral deodorizer)\n"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(children: [
                    Text(
                      "Customer Reviews",
                      style: TextStyles.font15Black700Weight,
                    ),
                    SizedBox(
                      width: 65.w,
                    ),
                    SvgPicture.asset("assets/svgs/Medal Star Square.svg"),
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => SetReviewBottomSheet(
                                    rateAmount: rateAmount, reviewText: reviewText,
                                  ));
                        },
                        child: Text(
                          "Write Your Review ",
                          style: TextStyles.font11Mainblue700Weight,
                        ))
                  ]),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 308.h,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        child: CustomCustomerReviews(
                          rateAmount: rateAmount, reviewText: reviewText,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: ColorsManager.whitegrey,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "Price :",
                                style: TextStyles.font14blackWei400ght,
                                children: [
                              TextSpan(
                                  text: " 850 EGP",
                                  style: TextStyles.font14Mainblue700Weight),
                            ])),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "|",
                          style: TextStyles.font16Mainblue700Weight,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Total Price :",
                                style: TextStyles.font14blackWei400ght,
                                children: [
                              TextSpan(
                                  text: " 850 EGP",
                                  style: TextStyles.font14Mainblue700Weight),
                            ])),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff020659), Color(0XFF031780)],
                            stops: [0.14, 0.4],
                            end: Alignment.centerRight,
                            begin: Alignment.centerLeft),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svgs/Cart Plus.svg"),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Add to Cart",
                            style: TextStyles.font15White700Weight,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        )));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/category_container.dart';
import 'package:yuki/core/shared_widgets/get_review_bottom_sheet.dart';
import 'package:yuki/core/shared_widgets/set_review_bottom_sheet.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/bottom_nav_bar/product_details/widgets/custom_customer_reviews.dart';
import 'package:yuki/features/bottom_nav_bar/product_details/widgets/custom_page_view_product_details.dart';
import '../products/products_view.dart';
import 'product_details_cubit.dart';
import 'product_details_state.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage(
      {super.key,
      required this.rateAmount,
      required this.reviewText,
      required this.id});

  PageController controller = PageController();
  final double rateAmount;
  final String reviewText;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            ProductDetailsCubit()..getProductDetails(id),
        child: Scaffold(body: SafeArea(
          child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              builder: (context, state) {
            final cubit = BlocProvider.of<ProductDetailsCubit>(context);
            return state is ProductDetailsLoadingState
                ? const Center(child: CircularProgressIndicator())
                : state is ProductDetailsStateInit
                    ? const Text("Error")
                    : ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () {
                                      MagicRouter.navigateTo(const ProductsPage(
                                        categoryId: 0,
                                      ));
                                    },
                                    child: Image.asset(
                                        "assets/images/back_arow.png")),
                                SvgPicture.asset(
                                  "assets/svgs/logo.svg",
                                  width: 50.w,
                                  height: 50.w,
                                )
                              ],
                            ),
                          ),
                          CustomPageViewProductDetails(
                            item: List.generate(
                                cubit.product?.images?.length ?? 0, (index) {
                              return CachedNetworkImage(
                                  imageUrl: cubit.imageUrl ?? '');
                            }),
                            imageUrl: cubit.productDetailsResponse?.data
                                    ?.product?.image ??
                                '',
                            onPageChanged: (value) {
                              cubit.updateIndicator(value);
                              cubit.updatContainerOnStack(value);
                            },
                            onTapRight: () {
                              if (cubit.currentPage >= 0 &&
                                  cubit.currentPage <
                                      (cubit.product?.images?.length ?? 3)) ;
                              controller.jumpToPage(cubit.currentPage + 1);
                            },
                            onTapLeft: () {
                              if (cubit.currentPage <=
                                      (cubit.product?.images?.length ?? 3) &&
                                  cubit.currentPage > 0) ;
                              controller.jumpToPage(cubit.currentPage - 1);
                            },
                            currentPage: cubit.currentPage,
                            pageController: controller,
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            cubit.productDetailsResponse?.data?.product?.name ??
                                '',
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                              Icons.remove,
                                              size: 17,
                                            ),
                                            color: ColorsManager.textgrey,
                                            onPressed: () {
                                              cubit.decreament();
                                            },
                                          ),
                                          Text("${cubit.count}"),
                                          IconButton(
                                              icon: const Icon(
                                                Icons.add,
                                                size: 17,
                                              ),
                                              color: ColorsManager.mainblue,
                                              onPressed: () {
                                                cubit.increament();
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
                                  title: cubit.productDetailsResponse?.data
                                          ?.product?.category?.name ??
                                      '',

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
                                  cubit.productDetailsResponse?.data?.product
                                          ?.statusKey ??
                                      '',
                                  style: TextStyles.font13Secondred700Weight,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            child: Text(
                              Bidi.stripHtmlIfNeeded(cubit
                                      .productDetailsResponse
                                      ?.data
                                      ?.product
                                      ?.description ??
                                  ''),
                              style: TextStyles.font13Black400Weight,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            child: Row(
                                children: List.generate(2, (index) {
                              return Flexible(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  child: CategoryContainer(
                                    onTap: () {
                                      cubit.updateIngredientsAndUseTo(index);
                                    },
                                    title: cubit.text[index],
                                    isSelected: cubit.index == index,
                                    horizontal: 40.w,
                                    vertical: 15.h,
                                    radius: 8,
                                    // height: 50.h,
                                  ),
                                ),
                              );
                            })),
                          ),
                          if (cubit.index == 0)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                "Ingredients:",
                                style: TextStyles.font15Mainblue700Weight,
                              ),
                            ),
                          if (cubit.index == 1)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                "How to Use:",
                                style: TextStyles.font15Mainblue700Weight,
                              ),
                            ),
                          SizedBox(
                            height: 10.h,
                          ),
                          if (cubit.index == 0)
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: Text(
                                  Bidi.stripHtmlIfNeeded(cubit
                                          .productDetailsResponse
                                          ?.data
                                          ?.product
                                          ?.components ??
                                      ''),
                                )),
                          if (cubit.index == 1)
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: Text(
                                  Bidi.stripHtmlIfNeeded(cubit
                                          .productDetailsResponse
                                          ?.data
                                          ?.product
                                          ?.howUse ??
                                      ''),
                                )),
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
                              SvgPicture.asset(
                                  "assets/svgs/Medal Star Square.svg"),
                              TextButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) =>
                                            SetReviewBottomSheet(
                                              rateAmount: rateAmount,
                                              reviewText: reviewText,
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
                                    rateAmount: rateAmount,
                                    reviewText: reviewText,
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
                                          style:
                                              TextStyles.font14blackWei400ght,
                                          children: [
                                        TextSpan(
                                            text:
                                                " ${cubit.product?.price ?? 0}",
                                            style: TextStyles
                                                .font14Mainblue700Weight),
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
                                          style:
                                              TextStyles.font14blackWei400ght,
                                          children: [
                                        TextSpan(
                                            text:
                                                " ${(cubit.product?.price ?? 0) * (cubit.count)}",
                                            style: TextStyles
                                                .font14Mainblue700Weight),
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
                                      colors: [
                                        Color(0xff020659),
                                        Color(0XFF031780)
                                      ],
                                      stops: [
                                        0.14,
                                        0.4
                                      ],
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
                                    SvgPicture.asset(
                                        "assets/svgs/Cart Plus.svg"),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/category_container.dart';
import 'package:yuki/core/shared_widgets/custom_product.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/shared_widgets/filter_buttom_sheet.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

import 'yukistore_cubit.dart';
import 'yukistore_state.dart';
import 'package:badges/badges.dart' as badges;

class YukistorePage extends StatelessWidget {
  const YukistorePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => YukistoreCubit(),
      child: Scaffold(
        body: SafeArea(child: BlocBuilder<YukistoreCubit, YukistoreState>(
            builder: (context, state) {
              final controller = BlocProvider.of<YukistoreCubit>(context);

              final cubit = context.read<YukistoreCubit>();

              return ListView(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.w, vertical: 10.h),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Image.asset("assets/images/back_arow.png"),
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: ColorsManager.grey,
                        //       borderRadius: BorderRadius.circular(5)),
                        //   child: Padding(
                        //     padding:  EdgeInsets.symmetric(horizontal: 15.w,),
                        //     child: IconButton(
                        //       onPressed: () {},
                        //       icon: const Icon(
                        //         Icons.arrow_back,
                        //         color: ColorsManager.mainblue,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        badges.Badge(
                          position: badges.BadgePosition.topEnd(
                              top: -4, end: 1),
                          child: SvgPicture.asset(
                            "assets/svgs/cart_icon.svg",
                            width: 45.w,
                            height: 45.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      cubit.activeIndex == 1
                          ? "Yuki Store"
                          : cubit.activeIndex == 0
                          ? "Flash Sale"
                          : "",
                      style: TextStyles.font20black700Weight,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      cubit.activeIndex == 1
                          ? "Browse Our Products"
                          : cubit.activeIndex == 0
                          ? 'Browse Our Flash sale Products'
                          : '',
                      style: TextStyles.font15Textgrey300Weight,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: CustomTextFormFeild(
                            hint: "What are you looking for ?",
                            hintColor: ColorsManager.icongrey,
                            prefixIcon:
                            Icon(Icons.search, color: ColorsManager.mainblue),
                            fillColor: ColorsManager.grey,
                            radius: 5,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        GestureDetector(onTap: () {
                          showModalBottomSheet(context: context,
                              builder: (context) => FilterButtomSheet(),);
                        },
                          child: Image.asset(
                            "assets/images/filter_icon.png",
                            width: 51.w,
                            height: 51.w,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(
                      thickness: 1,
                      color: ColorsManager.mainblue,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: List.generate(
                        3,
                            (index) {
                          final titles = ["All", "Hair Care", "Skin Care"];
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                cubit.updateActiveIndex(index);
                              },
                              child: Padding(
                                padding:
                                 EdgeInsets.symmetric(horizontal: 5.0.w),
                                child: CategoryContainer(
                                  title: titles[index],
                                  vertical: 10.h,
                                  horizontal: 0.w,
                                  isSelected: cubit.activeIndex == index,
                                  radius: 5,
                                  // change: cubit.change,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    StaggeredGrid.count(
                        axisDirection: AxisDirection.down,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: [
                          for (int i = 0; i < 5; i++)
                            if (cubit.activeIndex == 1)
                              CustomProduct(
                                  onTap: () {},
                                  previosPrice: 180.00,
                                  productName: "keratin serum",
                                  imageUrl: ("assets/images/spray.png"),
                                  currentPrice: 150.00,
                                  offerState: "10% 0ff"),
                          for (int i = 0; i < 5; i++)
                            if (cubit.activeIndex == 0)
                              CustomProduct(
                                  onTap: () {},
                                  previosPrice: 180.00,
                                  productName: "keratin serum",
                                  imageUrl: ("assets/images/spray.png"),
                                  currentPrice: 150.00,
                                  offerState: "10% 0ff"),
                        ])
                  ]);
            })),
      ),
    );
  }
}

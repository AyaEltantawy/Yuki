import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/shared_widgets/custom_product.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:badges/badges.dart' as badges;
import 'home_cubit.dart';
import 'home_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:yuki/core/theming/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..buildCarouselIndicator(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final controller = BlocProvider.of<HomeCubit>(context);
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 45.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/girl_photo_in_home.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/svgs/logo.svg",
                        width: 45.w,
                        height: 45.h,
                      ),
                      badges.Badge(
                        position: badges.BadgePosition.topEnd(top: -4, end: 1),
                        child: SvgPicture.asset(
                          "assets/svgs/notification.svg",
                          width: 45.w,
                          height: 45.h,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CustomTextFormFeild(
                    hint: "What are you looking for ?",
                    hintColor: ColorsManager.icongrey,
                    prefixIcon:
                        Icon(Icons.search, color: ColorsManager.mainblue),
                    fillColor: ColorsManager.grey,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Stack(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                            height: 163.h,
                            viewportFraction: 1,
                            initialPage: 0,
                            onPageChanged: (value, _) =>
                                controller.updateIndicator(value)),
                        items: controller.items
                            .map((e) => Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: e))
                            .toList(),
                      ),
                      controller.buildCarouselIndicator(),
                      Positioned(
                          bottom: 10,
                          left: 10,
                          child: SvgPicture.asset("assets/svgs/logo.svg"))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Flash Sale",
                              style: TextStyles.font15Secondblack700Weight),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text("Discover Our Flash Sale",
                              style: TextStyles.font12Textgrey400Weight)
                        ],
                      ),
                      Container(
                          width: 45.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                              color: ColorsManager.grey,
                              borderRadius: BorderRadius.circular(40)),
                          child: Icon(Icons.arrow_forward_outlined,
                              color: ColorsManager.mainblue)),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 260.h,
                    child: ListView.separated(
                      itemBuilder: (context, index) => CustomProduct(),
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10.w,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

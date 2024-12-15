import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/bottom_nav_bar/categories/widgets/custom_category_in_horizontal.dart';
import '../products/products_view.dart';
import 'categories_cubit.dart';
import 'categories_state.dart';
import 'package:badges/badges.dart' as badges;

class CategoriesPage extends StatelessWidget {
 final int? id ;
  const CategoriesPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CategoriesCubit(),
        child: Scaffold(
          body: SafeArea(
            child: BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                final controller = BlocProvider.of<CategoriesCubit>(context);
                return state is CategoriesLoadingState
                    ? Center(child: CircularProgressIndicator())
                    : state is CategoriesErrorState
                        ? Text("error")
                        : ListView(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    position: badges.BadgePosition.topEnd(
                                        top: -4, end: 1),
                                    child: SvgPicture.asset(
                                      "assets/svgs/notify.svg",
                                      width: 45.w,
                                      height: 45.h,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Categories",
                                      style: TextStyles.font20black700Weight,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "Shop By Category",
                                      style:
                                          TextStyles.font15Thirdgrey300Weight,
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: ColorsManager.mainblue,
                                    ),
                                  ]),
                              SizedBox(
                                height: 20.h,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                        controller.categoriesModel?.data
                                                ?.length ??
                                            3, (index) {
                                      return Column(children: [
                                        CustomCategoryInHorizontal(
                                          onTap: () {
                                            controller.categoryOntap(index);
                                            MagicRouter.navigateTo(
                                                ProductsPage(categoryId:controller.id));
                                          },
                                          categoryCount: controller
                                                  .categoriesModel
                                                  ?.data?[index]
                                                  .products ??
                                              3,
                                          imageUrl: controller.categoriesModel
                                                  ?.data?[index].image ??
                                              '',
                                          categoryName: controller
                                                  .categoriesModel
                                                  ?.data?[index]
                                                  .name ??
                                              '',
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        const Divider(
                                            thickness: 1,
                                            color: ColorsManager.bordergrey)
                                      ]);
                                    })),
                              ),
                            ],
                          );
              },
            ),
          ),
        ));
  }
}

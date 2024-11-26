import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/custom_more.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/favorite_products/favoriteproducts_view.dart';

import 'more_cubit.dart';
import 'more_state.dart';
import 'package:badges/badges.dart' as badges;

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MoreCubit(),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
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
                      image: AssetImage('assets/images/girl_photo_in_home.png'),
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
            SizedBox(height: 10.h),
            const Divider(
              thickness: 1,
              color: ColorsManager.mainblue,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomMore(
              imageUrl: "assets/svgs/settings.svg",
              title: "Account Settings",
              onPressed: () {},
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomMore(
              imageUrl: "assets/svgs/orders_icon.svg",
              title: "My Orders",
              onPressed: () {},
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomMore(
              imageUrl: "assets/svgs/return_order_icon.svg",
              title: "Return Orders",
              onPressed: () {},
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomMore(
              imageUrl: "assets/svgs/delivery_icon.svg",
              title: "Delivery Addresses",
              onPressed: () {},
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomMore(
              imageUrl: "assets/svgs/favorite_products_icon.svg",
              title: "Favorite Products",
              onPressed: () {MagicRouter.navigateTo(FavoriteProductsPage());},
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomMore(
              imageUrl: "assets/svgs/flash_sale_icon.svg",
              title: "Flash Sale",
              onPressed: () {},
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomMore(
              imageUrl: "assets/svgs/wallet_icon.svg",
              title: "My Wallet",
              onPressed: () {},
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomMore(
              imageUrl: "assets/svgs/loyalty_points_icon.svg",
              title: "Loyalty Points",
              onPressed: () {},
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomMore(
              imageUrl: "assets/svgs/discount_icon.svg",
              title: "Discount Coupons",
              onPressed: () {},
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomMore(
              imageUrl: "assets/svgs/app_language.svg",
              title: "App Language",
              onPressed: () {},
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomMore(
              imageUrl: "assets/svgs/terms_icon.svg",
              title: "Terms&Conditions",
              onPressed: () {},
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomMore(
              imageUrl: "assets/svgs/about_icon.svg",
              title: "About the App",
              onPressed: () {},
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomMore(
              imageUrl: "assets/svgs/share_icon.svg",
              title: "Share With Frinds",
              onPressed: () {},
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomMore(
              imageUrl: "assets/svgs/contact_us.svg",
              title: "Contact Us",
              onPressed: () {},
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomMore(
              imageUrl: "assets/svgs/signout_icon.svg",
              title: "Signout",
              onPressed: () {},
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }
}

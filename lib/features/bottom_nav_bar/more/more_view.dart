import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/features/bottom_nav_bar/more/discount_coupons/discount_coupons_view.dart';
import 'package:yuki/features/bottom_nav_bar/more/favorite_products/favoriteproducts_view.dart';
import 'package:yuki/features/bottom_nav_bar/more/terms_and_conditions/terms_and_conditions_view.dart';
import 'package:yuki/features/bottom_nav_bar/more/wallet/wallet_view.dart';
import 'package:yuki/features/bottom_nav_bar/more/widgets/custom_more.dart';
import 'package:yuki/features/bottom_nav_bar/more/widgets/language_bottom_sheet.dart';
import 'package:yuki/features/bottom_nav_bar/more/widgets/logout_bottom_sheet.dart';
import 'package:yuki/features/bottom_nav_bar/more/widgets/share_app_bottom_sheet.dart';
import 'package:yuki/core/theming/colors.dart';
import 'about_the_app/about_the_app_view.dart';
import 'account_settings/account_settings_view.dart';
import 'contactus/contactus_view.dart';
import 'loyalty_points/loyalty_points_view.dart';
import 'more_address/delivery_addresses/delivery_addresses_view.dart';
import 'more_cubit.dart';
import 'more_orders/orders/orders_view.dart';
import 'more_return_order/return_orders/return_orders_view.dart';
import 'more_state.dart';
import 'package:badges/badges.dart' as badges;

import 'notifications/notifications_view.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MoreCubit(),
      child: Scaffold(
        body: SafeArea(
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
                        image:
                            AssetImage('assets/images/girl_photo_in_home.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/svgs/logo.svg",
                    width: 45.w,
                    height: 45.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      MagicRouter.navigateTo(NotificationsPage());
                    },
                    child: badges.Badge(
                      position: badges.BadgePosition.topEnd(top: -4, end: 1),
                      child: SvgPicture.asset(
                        "assets/svgs/notify.svg",
                        width: 45.w,
                        height: 45.h,
                      ),
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
                onPressed: () {
                  MagicRouter.navigateTo(AccountSettingsPage());
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomMore(
                imageUrl: "assets/svgs/orders_icon.svg",
                title: "My Orders",
                onPressed: () {
                  MagicRouter.navigateTo(OrdersPage());
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomMore(
                imageUrl: "assets/svgs/return_order_icon.svg",
                title: "Return Orders",
                onPressed: () {
                  MagicRouter.navigateTo(ReturnOrdersPage());
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomMore(
                imageUrl: "assets/svgs/delivery_icon.svg",
                title: "Delivery Addresses",
                onPressed: () {
                  MagicRouter.navigateTo(DeliveryAddressesPage());
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomMore(
                imageUrl: "assets/svgs/favorite_products_icon.svg",
                title: "Favorite Products",
                onPressed: () {
                  MagicRouter.navigateTo(FavoriteProductsPage());
                },
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
                onPressed: () {
                  MagicRouter.navigateTo(WalletPage());
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomMore(
                imageUrl: "assets/svgs/loyalty_points_icon.svg",
                title: "Loyalty Points",
                onPressed: () {
                  MagicRouter.navigateTo(LoyaltyPointsPage());
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomMore(
                imageUrl: "assets/svgs/discount_icon.svg",
                title: "Discount Coupons",
                onPressed: () {
                  MagicRouter.navigateTo(DiscountCouponsPage());
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomMore(
                imageUrl: "assets/svgs/app_language.svg",
                title: "App Language",
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return LanguageBottomSheet();
                    },
                  );
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomMore(
                imageUrl: "assets/svgs/terms_icon.svg",
                title: "Terms&Conditions",
                onPressed: () {
                  MagicRouter.navigateTo(TermsAndConditionsPage());
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomMore(
                imageUrl: "assets/svgs/about_icon.svg",
                title: "About the App",
                onPressed: () {
                  MagicRouter.navigateTo(AboutTheAppPage());
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomMore(
                imageUrl: "assets/svgs/share_icon.svg",
                title: "Share With Frinds",
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ShareAppBottomSheet();
                    },
                  );
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomMore(
                imageUrl: "assets/svgs/contact_us.svg",
                title: "Contact Us",
                onPressed: () {
                  MagicRouter.navigateTo(ContactusPage());
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomMore(
                imageUrl: "assets/svgs/signout_icon.svg",
                title: "Signout",
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return LogoutBottomSheet();
                      });
                },
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

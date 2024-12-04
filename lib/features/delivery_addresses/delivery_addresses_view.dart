import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/address_card.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/add_new_address/add_new_address_view.dart';
import 'package:yuki/features/payment/payment_view.dart';

import 'delivery_addresses_cubit.dart';
import 'delivery_addresses_state.dart';

class DeliveryAddressesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => DeliveryAddressesCubit(),
        child: Scaffold(
          body: SafeArea(
              child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            children: [
              Row(
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
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Delivery Addresses",
                style: TextStyles.font20black700Weight,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Your Delivery Addresses list",
                style: TextStyles.font15Thirdgrey300Weight,
              ),
              const Divider(
                thickness: 1,
                color: ColorsManager.mainblue,
              ),
              SizedBox(
                height: 15.h,
              ),
              AddressCard(
                border: Border.all(width: 1, color: ColorsManager.mainblue),
                addressName: "Home",
                choose: false,
              ),
              SizedBox(
                height: 20.h,
              ),
              AddressCard(
                addressName: "Work",
                choose: false,
              ),
              SizedBox(
                height: 20.h,
              ),
              const AddressCard(
                addressName: "Office",
                choose: false,
              ),
              CustomButton(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset("assets/svgs/white_add_icon.svg"),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Add new Address",
                    style: TextStyles.font16White700Weight,
                  )
                ]),
                onPressed: () {
                  MagicRouter.navigateTo(AddNewAddressPage());
                },
              )
            ],
          )),
        ));
  }
}

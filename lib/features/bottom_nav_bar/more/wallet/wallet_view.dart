import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

import 'wallet_cubit.dart';
import 'wallet_state.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WalletCubit(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
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
                textAlign: TextAlign.center,
                "My Wallet",
                style: TextStyles.font20black700Weight,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                textAlign: TextAlign.center,
                "Follow your wallet balance",
                style: TextStyles.font15Thirdgrey300Weight,
              ),
              Image.asset("assets/images/wallet.png"),
              Container(
                decoration: BoxDecoration(
                    color: ColorsManager.grey,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 48,
                          color: Color(0xff0000000D),
                          offset: Offset(0, 2))
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Current Balance",
                        style: TextStyles.font16Icongrey700Weight,
                      ),
                      SizedBox(height: 20.h,),
                      Text(
                        "4500.00",
                        style: TextStyles.font20black700Weight,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

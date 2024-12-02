import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/loyalty_points/widgets/convert_loyalty_bottom_sheet.dart';

import 'loyalty_points_cubit.dart';
import 'loyalty_points_state.dart';

class LoyaltyPointsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoyaltyPointsCubit(),
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
                "Loyalty Points",
                style: TextStyles.font20black700Weight,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                textAlign: TextAlign.center,
                "Follow & Control Your Loyalty Points ",
                style: TextStyles.font15Thirdgrey300Weight,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Image.asset("assets/images/loyalty_points.png"),
              ),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Current Balance",
                        style: TextStyles.font16Icongrey700Weight,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "10000",
                        style: TextStyles.font20black700Weight,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Loyalty point",
                        style: TextStyles.font15Mainblue700Weight,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Every 1,000 loyalty points = 10 EGP",
                        style: TextStyles.font13Textgrey400Weight,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ConvertLoyaltyBottomSheet();
                        });
                  },
                  child: Text(
                    textAlign: TextAlign.center,
                    "Convert loyalty points into wallet balance",
                    style: TextStyles.font15White700Weight,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

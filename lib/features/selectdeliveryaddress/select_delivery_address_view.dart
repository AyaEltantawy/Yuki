import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

import 'select_delivery_address_cubit.dart';
import 'select_delivery_address_state.dart';

class SelectdeliveryaddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SelectdeliveryaddressCubit(),
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
                "Select Delivery Address",
                style: TextStyles.font20black700Weight,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Choose the address you want your order to be delivered to.",
                style: TextStyles.font15Thirdgrey300Weight,
              ),
              Divider(thickness: 1,color: ColorsManager.mainblue,),
                SizedBox(height: 20.h,),


                Row
                  (mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Column(children: [
                    Image.asset("assets/images/icon_address_blue.png"),
                    SizedBox(height: 5.h,),
                    Text("Select Delivery Address",style: TextStyles.font10Secondblack700Weight,),
                    

                  ],),
                  SvgPicture.asset("assets/svgs/cutted_line.svg"),
                  Column(
                    children: [
                      SvgPicture.asset("assets/svgs/pallet.svg"),
                      SizedBox(height: 5.h,),
                      Text("Complete Payment",style: TextStyles.font10Black400Weight,)
                      
                      
                    ],
                    
                    
                  )



                ],)
            ],
          )),
        ));
  }
}

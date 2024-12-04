import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

import 'order_tracking_cubit.dart';
import 'order_tracking_state.dart';

class OrderTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => OrderTrackingCubit(),
        child: Scaffold(body: SafeArea(child:
            BlocBuilder<OrderTrackingCubit, OrderTrackingState>(
                builder: (context, state) {
          final controller = BlocProvider.of<OrderTrackingCubit>(context);
          return ListView(padding: EdgeInsets.symmetric(horizontal: 20.w,vertical:20.h),
              children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/back_arow.png"),
                SvgPicture.asset(
                  "assets/svgs/cart_icon.svg",
                  width: 45.w,
                  height: 45.h,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Order Tracking",
              style: TextStyles.font20black700Weight,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Track your order step by step",
              style: TextStyles.font15Thirdgrey300Weight,
            ),
            const Divider(
              thickness: 1,
              color: ColorsManager.mainblue,
            ),
            SizedBox(
              height: 20.h,
            ),
                      SvgPicture.asset("assets/svgs/order_tracking_svg.svg"),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Image.asset("assets/images/order_tracking_second_image.png"),
                  SizedBox(width: 20.w,),
                  
                  Flexible(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children:[Text("In Review",style:TextStyles.font15Black700Weight),
                    SizedBox(height: 10.h,),
                      Text("Your order in review now",style:TextStyles. Font12Secondblack400Weight),
                      SizedBox(height: 35.h,),
                      Text("In Progress",style:TextStyles.font15Icongrey400Weight),
                      SizedBox(height: 5.h,),
                      Text("Your order is being prepared now",style:TextStyles. font12Icongrey400Weight),
                      SizedBox(height: 35.h,),
                      Text("shipped",style:TextStyles.font15Icongrey400Weight),
                      SizedBox(height: 5.h,),
                      Text("Your order in the way now",style:TextStyles. font12Icongrey400Weight),
                      SizedBox(height: 35.h,),
                      Text("Delivered",style:TextStyles.font15Icongrey400Weight),
                      SizedBox(height: 5.h,),
                      Text("Your order has been delivered, rate your experince",style:TextStyles. font12Icongrey400Weight),
                      SizedBox(height: 20.h,),
                    
                    
                    
                    
                    ]),
                  )




                ],)
          ]);
        }))));
  }
}

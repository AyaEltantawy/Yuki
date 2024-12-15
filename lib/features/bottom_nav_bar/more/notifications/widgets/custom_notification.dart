import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/theming/styles.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({super.key, this.title});
 final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              spreadRadius: 0,
              blurRadius: 48,
              offset: Offset(0, 2),
              color: Color(0xff1312120D)),
        ],
      ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal:10.w,vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      SvgPicture.asset("assets/svgs/Notification.svg"),
        SizedBox(width: 10.w,),
        Flexible(
          child: Column(crossAxisAlignment:   CrossAxisAlignment.start,
            children: [

              Text(title??'',style: TextStyles.font14Secondblack400Weight,),
              SizedBox(height: 10.h),
              Text("2 mins ago",style: TextStyles.font14Icongrey300Weight,)



            ],
          ),
        )



      ],),
    ),);
  }
}

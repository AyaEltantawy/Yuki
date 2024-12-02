import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/notifications/widgets/custom_notification.dart';

import 'notifications_cubit.dart';
import 'notifications_state.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NotificationsCubit(),
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
                "Notifications",
                style: TextStyles.font20black700Weight,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Follow your notifications",
                style: TextStyles.font15Thirdgrey300Weight,
              ),
              const Divider(
                thickness: 1,
                color: ColorsManager.mainblue,
              ),
              SizedBox(height: 20.h,),
              CustomNotification(),
              SizedBox(height: 10.h,),
              CustomNotification(),
              SizedBox(height: 10.h,),
              CustomNotification(),
              SizedBox(height: 10.h,),
              CustomNotification(),
              SizedBox(height: 10.h,),
              CustomNotification(),
              SizedBox(height: 10.h,),
              CustomNotification(),
            ],
          ),
        ),
      ),
    );
  }
}

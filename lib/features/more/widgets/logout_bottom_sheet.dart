import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: SafeArea(
        child: ListView(shrinkWrap: true, children: [
          Divider(
            indent: 160,
            endIndent: 160,
            thickness: 3,
            color: ColorsManager.fivegrey,
          ),
          SizedBox(
            height: 20.h,
          ),
          Image.asset(
            "assets/images/Exit.png",
            width: 80.w,
            height: 80.w,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "Signout",
            style: TextStyles.font18Secondblack700Weight,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Do you want to signout of your account ?",
            style: TextStyles.font13Greyblack300Weight,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    child: Text("Back",style: TextStyles. font13White700Weight),
                  ),
                ),
                SizedBox(width: 10.w,),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: ColorsManager.red)),
                child:
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 14.h),
                  child: Text("Signout",style: TextStyles.font13Secondred700Weight,textAlign: TextAlign.center,),
                ),),
                )
              ],
            ),
          ),
          SizedBox(height: 20.h,)

        ]),
      ),
    );
  }
}

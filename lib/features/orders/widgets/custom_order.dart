import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class CustomOrder extends StatelessWidget {
  const CustomOrder({super.key, required this.isCancel});
final bool isCancel ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorsManager.grey,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 48,
                spreadRadius: 0,
                color: Color(0xff0000000D))
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Order no. : ",
                      style: TextStyles.font13Icongrey400Weight,
                      children: [
                        TextSpan(
                            text: "#46679797",
                            style: TextStyles.font13black700Weight),
                      ]),
                ),
                Text(
                  "2500 EGP",
                  style: TextStyles.font15Mainblue700Weight,
                )
              ],
            ),
            SizedBox(height: 10.h),
            RichText(
              text: TextSpan(
                  text: "Order Status : ",
                  style: TextStyles.font13Icongrey400Weight,
                  children: [
                    TextSpan(
                        text: "In Review",
                        style: TextStyles.font13black700Weight),
                  ]),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Sunday , 12 Nov 2023",
              style: TextStyles.font13Icongrey400Weight,
            ),
            SizedBox(height: 20.h,),
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                        child: Text(
                  "Track",
                  style: TextStyles.font13White700Weight,
                ))),
                SizedBox(width: 5.w,),
                isCancel == true?
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: ColorsManager.red)),
                    child:
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 14.h),
                      child: Text("Cancel order",style: TextStyles.font13Secondred700Weight,textAlign: TextAlign.center,),
                    ),),
                )
              :Container()],
            )
          ],
        ),
      ),
    );
  }
}

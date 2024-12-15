import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

import '../../features/bottom_nav_bar/more/returnorder/returnorder_view.dart';

class CustomOrder extends StatelessWidget {

  const CustomOrder(
      {super.key,
      this.isCancel,
      required this.statusText,
      this.isReturn,
      this.firstButtonText,
      this.secondButtonText, this.onTap});

  final bool? isCancel;

  final String statusText;
  final bool? isReturn;
  final String? firstButtonText;

  final String? secondButtonText;
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:onTap ,
      child: Container(
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
                          text: statusText,
                          style: statusText == "Delivered"|| statusText == "Accepted"
                              ? TextStyles.Font13Stronggreen700Weight
                              : statusText == "Canceled"||statusText == "Rejected"
                                  ? TextStyles.Font13Thirdred700Weight:
                          statusText =="Pending"?TextStyles.Font13Yellow700Weight
                                  : TextStyles.font13black700Weight),
                    ]),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Sunday , 12 Nov 2023",
                style: TextStyles.font13Icongrey400Weight,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
              isReturn == false  ?   Expanded(
                      child:
                         CustomButton(
                              child: Text(
                              firstButtonText ?? "Track",
                              style: TextStyles.font13White700Weight,
                            ))
                          ): Container(),
                  SizedBox(
                    width: 5.w,
                  ),
                  isCancel == true
                      ? Expanded(
                          child: InkWell(onTap: (){MagicRouter.navigateTo(ReturnorderPage(orderStatus:"Delivered"));},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: ColorsManager.red)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                child: Text(
                                  secondButtonText ?? "Cancel order",
                                  style: TextStyles.font13Secondred700Weight,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class LanguageBottomSheet extends StatelessWidget {
  bool isChecked = false;

  LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: ColorsManager.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        indent: 135,
                        endIndent: 135,
                        thickness: 3,
                        color: ColorsManager.fivegrey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          "App Language",
                          style: TextStyles.font15Black700Weight,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Text(
                          "Choose your preference App Language",
                          style: TextStyles.font13Textgrey300Weight,
                        ),
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            StatefulBuilder(builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/svgs/Saudi Arabia (SA).svg"),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "العربية",
                          style: TextStyles.font15Black400Weight,
                        )
                      ],
                    ),
                    Checkbox(
                      activeColor: ColorsManager.mainblue,
                        shape: OvalBorder(),
                        side: BorderSide(color: ColorsManager.mainblue,width: 1),
                        value: isChecked,

                        onChanged: (value) {
                          isChecked = !isChecked;
                          setState(() {});
                        })
                  ],
                ),
              );
            }),
            StatefulBuilder(builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/svgs/United Kingdom (GB).svg"),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "English",
                          style: TextStyles.font15Black400Weight,
                        )
                      ],
                    ),
                    Checkbox(
                        activeColor: ColorsManager.mainblue,
                        shape: OvalBorder(),
                        side: BorderSide(color: ColorsManager.mainblue,width: 1),
                        value: isChecked,

                        onChanged: (value) {
                          isChecked = !isChecked;
                          setState(() {});
                        })
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

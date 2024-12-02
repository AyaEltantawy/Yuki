import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/shared_widgets/category_container.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class ShareAppBottomSheet extends StatelessWidget {
  const ShareAppBottomSheet({super.key});

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
                          "Share The App",
                          style: TextStyles.font15Black700Weight,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Text(
                          "Share the application with your frinds",
                          style: TextStyles.font13Textgrey300Weight,
                        ),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/share.png",
                    width: 80.w,
                    height: 80.w,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextFormFeild(
                        hint: "http://play.google.com/store/,",
                        hintColor: ColorsManager.sevengrey,
                      )),
                      CategoryContainer(
                          title: "Copy link",
                          isSelected: true,
                          horizontal: 15.w,
                          vertical: 15.h,
                          radius: 5)
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svgs/Whatsapp ic.svg"),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset("assets/svgs/linkedin.svg"),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset("assets/svgs/youtube.svg"),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset("assets/svgs/instagram.svg"),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset("assets/svgs/facebook.svg"),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: ColorsManager.seconderyblue, width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 145.w,vertical: 13.h),
                      child: Text(textAlign: TextAlign.center,
                        "Back",
                        style: TextStyles.font15Seconderyblue700Weight,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

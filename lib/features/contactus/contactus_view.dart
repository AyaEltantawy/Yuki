import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

import 'contactus_cubit.dart';
import 'contactus_state.dart';

class ContactusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ContactusCubit(),
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
                "Contact Us",
                style: TextStyles.font20black700Weight,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Don’t hastate to contacts us anytime ",
                style: TextStyles.font15Thirdgrey300Weight,
              ),
              const Divider(
                thickness: 1,
                color: ColorsManager.mainblue,
              ),
              CustomTextFormFeild(
                prefixIcon: SvgPicture.asset("assets/svgs/user_icon.svg"),
                hint: "Name",
                upperText: "Name",
                radius: 5,
              ),
              CustomTextFormFeild(
                upperText: "Email Address",
                prefixIcon: SvgPicture.asset("assets/svgs/email_icon.svg"),
                hint: "Email Address",
                radius: 5,
                //controller: controller.emailController,
              ),
              CustomTextFormFeild(
                upperText: "Your Message",
                prefixIcon: Padding(
                  padding: EdgeInsets.only(bottom: 22.h),
                  child: SvgPicture.asset("assets/svgs/Pen 2.svg"),
                ),
                hint: "Type your message here ...",
                radius: 5,
                maxLines: 2,

                //controller: controller.emailController,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: CustomButton(
                  child: Text("Send", style: TextStyles.font16White700Weight),
                ),
              ),
              Row(children: [
                SvgPicture.asset("assets/svgs/Phone Calling Rounded.svg"),
               SizedBox(width: 10.w,),
                Flexible(
                  child: RichText(


                    text: TextSpan(text: "contact numbers:\n",style: TextStyles.font15Icongrey400Weight,
                    children: [
                      TextSpan(text:"050225123 - 0123456789 - 01123456789",style: TextStyles.font15Black400Weight)

                    ]

                  ),

                  ),
                ),

              ],),
              SizedBox(height: 15.h,),
              Row(children: [
                SvgPicture.asset("assets/svgs/Mail.svg"),
                SizedBox(width: 10.w,),
                Flexible(
                  child: RichText(


                    text: TextSpan(text: "Email Address\n",style: TextStyles.font15Icongrey400Weight,
                        children: [
                          TextSpan(text:"info@Yukimagic.com",style: TextStyles.font15Black400Weight)

                        ]

                    ),

                  ),
                ),

              ],),
              SizedBox(height: 20.h,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svgs/X (1).svg"),
                  SizedBox(width: 5.w,),
                  SvgPicture.asset("assets/svgs/youtube (1).svg"),
                  SizedBox(width: 5.w,),
                  SvgPicture.asset("assets/svgs/linkedin (1).svg"),
                  SizedBox(width: 5.w,),
                  SvgPicture.asset("assets/svgs/tiktok.svg"),
                  SizedBox(width: 5.w,),
                  SvgPicture.asset("assets/svgs/Whatsapp ic (1).svg"),
                  SizedBox(width: 5.w,),
                  SvgPicture.asset("assets/svgs/Snapchat.svg"),
                  SizedBox(width: 5.w,),
                  SvgPicture.asset("assets/svgs/insta.svg"),
                  SizedBox(width: 5.w,),
                  SvgPicture.asset("assets/svgs/face_book.svg"),
                  SizedBox(width: 5.w,),
                  SvgPicture.asset("assets/svgs/network.svg"),



                ],

              )

            ],
          ),
        ),
      ),
    );
  }
}

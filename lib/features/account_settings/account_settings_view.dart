import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/account_settings/widgets/change_password_bottom_sheet.dart';

import 'account_settings_cubit.dart';
import 'account_settings_state.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AccountSettingsCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<AccountSettingsCubit, AccountSettingsState>(
            builder: (context, state) {
              final controller = BlocProvider.of<AccountSettingsCubit>(context);
              return ListView(
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
                    "Account Settings",
                    style: TextStyles.font20black700Weight,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Control your account settings",
                    style: TextStyles.font15Thirdgrey300Weight,
                  ),
                  const Divider(
                    thickness: 1,
                    color: ColorsManager.mainblue,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 120.w,
                        height: 120.w,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/girl_photo_in_settings.png",
                                ),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle),
                      ),
                      Positioned(
                          bottom: 10.h,
                          right: 105.w,
                          child: SvgPicture.asset(
                            "assets/svgs/blue_camera_icon.svg",
                          ))
                    ],
                  ),
                  CustomTextFormFeild(
                    prefixIcon: SvgPicture.asset("assets/svgs/user_icon.svg"),
                    hint: "name",
                    upperText: "Name",
                  ),
                  CustomTextFormFeild(
                    upperText: "Email Address",
                    prefixIcon: SvgPicture.asset("assets/svgs/email_icon.svg"),
                    hint: "Email Address",
                    controller: controller.emailController,
                  ),
                  Text(
                    "Phone Number",
                    style: TextStyles.font14blackWei400ght,
                  ),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      fillColor: ColorsManager.lightgrey,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                    initialCountryCode: 'EG',
                  ),
                  Text(
                    "Link Personal account",
                    style: TextStyles.font15Secondblack700Weight,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svgs/google_icon_without_container.svg",
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Google",
                                style: TextStyles.font13black700Weight,
                              ),
                              Text(
                                controller.isConnected == true
                                    ? "Connected"
                                    : "DisConnected",
                                style: controller.isConnected == true
                                    ? TextStyles.font11Green400Weight
                                    : TextStyles.font11red400Weight,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            controller.emailController.text,
                            style: TextStyles.font13Icongrey400Weight,
                          ),
                        ),
                        // SizedBox(
                        //   width: 50.w,
                        // ),

                        CupertinoSwitch(
                          value: controller.isConnected,
                          onChanged: (bool value) {
                            return controller.switchConnected();
                          },
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border:
                        Border.all(color: ColorsManager.mainblue, width: 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 12.h),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Change Password",
                          style: TextStyles.font16Seconderyblue700Weight,
                        ),
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(context: context, builder: (context)
                      {
                        return const ChangePasswordBottomSheet();
                      },
                      );
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(child:Text( "Save Changes",style:TextStyles.font16White700Weight))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

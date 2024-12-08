import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/account_settings/account_settings_state.dart';

class ChangePasswordBottomSheet extends StatelessWidget {
  final TextEditingController? passwordController ;
   ChangePasswordBottomSheet({super.key, this.passwordController, required this.changePassword});

  final void Function() changePassword;
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
                          "Change Password",
                          style: TextStyles.font15Black700Weight,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Text(
                          "Do you want to change your password ?",
                          style: TextStyles.font13Textgrey300Weight,
                        ),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  CustomTextFormFeild(

                    prefixIcon:
                        SvgPicture.asset("assets/svgs/password_icon.svg"),
                    hint: "Password",
                    secure: true,
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined,
                        color: ColorsManager.icongrey),
                    upperText: "New Password",
                    controller: passwordController,
                  ),
                  CustomTextFormFeild(
                    prefixIcon:
                        SvgPicture.asset("assets/svgs/password_icon.svg"),
                    hint: "Password Confirmation",
                    secure: true,
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined,
                        color: ColorsManager.icongrey),
                    upperText: "New Password Confirmation",
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),

                    child: CustomButton(
                      onPressed: (){changePassword();},

                      child: Text( "Confirm",style: TextStyles.font16White700Weight),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

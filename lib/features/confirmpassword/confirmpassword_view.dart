import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/shared_widgets/show_dialog.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/login/login_view.dart';

import '../../core/shared_widgets/custom_button.dart';
import 'confirmpassword_cubit.dart';
import 'confirmpassword_state.dart';

class ConfirmpasswordPage extends StatelessWidget {
 final String email;
 final String otpCode;
  const ConfirmpasswordPage({super.key, required this.email, required this.otpCode});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ConfirmpasswordCubit()..email=email..otpCode=otpCode,
      child: Scaffold(
        body: SafeArea(
          
          child: BlocBuilder<ConfirmpasswordCubit, ConfirmpasswordState>(
  builder: (context, state) {
    final controller = BlocProvider.of<ConfirmpasswordCubit>(context);
    return Form(
      key: controller.formkey,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                          color: const Color(0xffF2F2F2),
                          borderRadius: BorderRadius.circular(5)),
                      child: IconButton(
                        alignment: Alignment.center,
                        onPressed: () {
                          MagicRouter.navigateTo(const LoginPage());
                        },
                        icon: const Icon(Icons.arrow_back,
                            color: ColorsManager.mainblue),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/svgs/logo.svg",
                      width: 49.33.w,
                      height: 50.h,
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Reset Your Password",
                  style: TextStyles.font30Black700Weight,
                ),
                Text(
                  "Please enter a new password and confirm it to complete the password reset process.",
                  style: TextStyles.font16Black300Weight,
                ),
                Image.asset(
                  "assets/images/confirm_password_image.png",
                  width: 140.45,
                  height: 265,
                ),
                CustomTextFormFeild(
                  controller:controller.passwordController  ,
                  prefixIcon: SvgPicture.asset("assets/svgs/password_icon.svg"),
                  hint: "Password",
                  secure: true,
                  suffixIcon: const Icon(Icons.remove_red_eye_outlined,
                      color: ColorsManager.icongrey),
                  upperText: "New Password",
                ),
                CustomTextFormFeild(
                  controller: controller.confirmPasswordController,
                  prefixIcon: SvgPicture.asset("assets/svgs/password_icon.svg"),
                  hint: "Password Confirmation",
                  secure: true,
                  suffixIcon: const Icon(Icons.remove_red_eye_outlined,
                      color: ColorsManager.icongrey),
                  upperText: "New Password Confirmation",
                ),
                SizedBox(height: 20.h),
                CustomButton(
                 child: Text("Confirm",style: TextStyles.font16White700Weight,),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => ResetPasswordDialog(
                        defaultText: 'Congratulations',
                        mainText: 'Your password has been successfully reset.',

                      ),

                    );
                    controller.confirmPassword();
                  },
                ),
              ],
            ),
          );
  },
),
        ),
      ),
    );
  }
}

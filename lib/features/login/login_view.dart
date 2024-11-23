import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';

import 'package:yuki/core/shared_widgets/text_button.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/home/home_view.dart';
import 'package:yuki/features/register/register_view.dart';
import 'package:yuki/features/reset_password/reset_password_view.dart';
//

import 'login_cubit.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding:  EdgeInsets.only(
              right: 20.w,left: 20.h ,top: 20.h,bottom: 20.h
            ),
            children: [
              SvgPicture.asset("assets/svgs/signin_Logo.svg"),
              SizedBox(height: 10.h),
              Text(
                "Login",
                style: TextStyles.font30Black700Weight,
              ),
              Row(children: [
                Text(
                  "Don’t Have an account?",
                  style: TextStyles.font16Black300Weight,
                ),

                CustomTextButton(
                  text: "Create New Account",
                  onpressed: () {
                    MagicRouter.navigateTo(RegisterPage());
                  },
                  fontWeight: FontWeight.w700,
                  fontsize: 14,
                  color: ColorsManager.mainblue,
                  textDecoration:TextDecoration. none,


                ),
              ]),
              SizedBox(
                height: 30.h,
              ),
              CustomTextFormFeild(
                prefixIcon: SvgPicture.asset("assets/svgs/email_icon.svg"),
                hint: "Email Address",
                upperText: "Email Address",
              ),
              CustomTextFormFeild(
                prefixIcon: SvgPicture.asset("assets/svgs/password_icon.svg"),
                hint: "Password",
                secure: true,
                suffixIcon: const Icon(Icons.remove_red_eye_outlined,
                    color: ColorsManager.icongrey),
                upperText: "Password",
              ),
              CustomTextButton(
                text: "Forget Password ?",
                alignment: Alignment.centerRight,
                onpressed: () {MagicRouter.navigateTo(ResetPasswordPage());},
              ),
              CustomButton(
                onPressed: () {MagicRouter.navigateTo(HomePage());},
                text: 'Login',
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: ColorsManager.linegrey,
                      thickness: 1,
                    ),
                  ),
                  // Text in the middle
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Or',
                      style: TextStyles.font12Seconderyblue400Weight,
                    ),
                  ),
                  // Right Divider
                  const Expanded(
                    child: Divider(
                      color: ColorsManager.linegrey,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 325.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border:
                        Border.all(width: 1, color: ColorsManager.bordergrey)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svgs/google_logo.svg"),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text("Continue With Google",
                        style: TextStyles.font14blackWei400ght)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

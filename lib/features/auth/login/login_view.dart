import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/shared_widgets/text_button.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/auth/register/register_view.dart';
import 'package:yuki/features/auth/reset_password/reset_password_view.dart';
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
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              final controller = BlocProvider.of<LoginCubit>(context);
              return Form(
                key: controller.formKey,
                child: ListView(
                  padding: EdgeInsets.only(
                      right: 20.w, left: 20.h, top: 20.h, bottom: 20.h),
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
                        textDecoration: TextDecoration.none,
                      ),
                    ]),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomTextFormFeild(
                      prefixIcon:
                          SvgPicture.asset("assets/svgs/email_icon.svg"),
                      hint: "Email Address",
                      upperText: "Email Address",
                      controller: controller.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }

                        if (!RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormFeild(
                      prefixIcon:
                          SvgPicture.asset("assets/svgs/password_icon.svg"),
                      hint: "Password",
                      controller: controller.passwordController,
                      secure: false,
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined,
                          color: ColorsManager.icongrey),
                      upperText: "Password",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 9 characters';
                        }
                        return null;
                      },
                    ),
                    CustomTextButton(
                      text: "Forget Password ?",
                      alignment: Alignment.centerRight,
                      onpressed: () {
                        MagicRouter.navigateTo(ResetPasswordPage());
                      },
                    ),
                    state is LoadingLogin
                        ? const SpinKitThreeBounce(
                            color: ColorsManager.mainblue,
                            size: 26.0,
                          )
                        : CustomButton(
                            onPressed: () {
                              controller.Login();
                            },
                            child: Text('Login',
                                style: TextStyles.font16White700Weight),
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
                          border: Border.all(
                              width: 1, color: ColorsManager.bordergrey)),
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
              );
            },
          ),
        ),
      ),
    );
  }
}

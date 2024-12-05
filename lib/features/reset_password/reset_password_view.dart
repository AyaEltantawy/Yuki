import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/shared_widgets/show_dialog.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/confirmpassword/confirmpassword_view.dart';
import 'package:yuki/features/login/login_view.dart';
import 'package:yuki/features/otp/otp_view.dart';

import 'reset_password_cubit.dart';
import 'reset_password_state.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ResetPasswordCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
            builder: (context, state) {
              final controller = BlocProvider.of<ResetPasswordCubit>(context);
              return Form(
                key: controller.formKey,
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                      "Kindly enter the email address linked to your account. We'll immediately send you an email with a code to reset your password",
                      style: TextStyles.font16Black300Weight,
                    ),
                    Image.asset(
                      "assets/images/reset_password_image.png",
                      width: 140.45,
                      height: 265,
                    ),
                    BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                      builder: (context, state) {
                        final controller =
                            BlocProvider.of<ResetPasswordCubit>(context);
                        String? errorMessage;

                        return CustomTextFormFeild(
                          controller: controller.emailController,
                          prefixIcon:
                              SvgPicture.asset("assets/svgs/email_icon.svg"),
                          hint: "Email Address",
                          upperText: "Email Address",
                          errorText: errorMessage,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                      builder: (context, state) {
                        final controller =
                            BlocProvider.of<ResetPasswordCubit>(context);
                        return CustomButton(
                            child: Text(
                              "Confirm",
                              style: TextStyles.font16White700Weight,
                            ),
                            onPressed: () {
                              controller.ResetPassword();
                              // if (controller.isValidEmail) {
                              //   MagicRouter.navigateTo(OtpPage(
                              //     email: controller.emailController.text,
                              //     title: 'Reset Your Password',
                              //     onPressed: () {
                              //       MagicRouter.navigateTo(const ConfirmpasswordPage());
                              // },
                              //    ));
                            }
                            //},
                            );
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

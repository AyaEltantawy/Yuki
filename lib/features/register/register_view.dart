import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/shared_widgets/text_button.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/otp/otp_view.dart';

import '../../core/shared_widgets/reset_password_dialog.dart';
import 'register_cubit.dart';
import 'register_state.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
        child: Scaffold(
          body: SafeArea(
            child: BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                final controller = BlocProvider.of<RegisterCubit>(context);
                return Form(
                  key: controller.formKey,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    children: [
                      SvgPicture.asset("assets/svgs/signin_Logo.svg"),
                      SizedBox(height: 10.h),
                      Text(
                        "Create New Account",
                        style: TextStyles.font30Black700Weight,
                      ),
                      Row(children: [
                        Text(
                          "Already Have an account?",
                          style: TextStyles.font16Black300Weight,
                        ),
                        CustomTextButton(
                          text: "Login",
                          onpressed: () {
                            MagicRouter.navigateTo(RegisterPage());
                          },
                          fontWeight: FontWeight.w700,
                          fontsize: 17,
                          color: ColorsManager.mainblue,
                          textDecoration: TextDecoration.none,
                        ),
                      ]),
                      CustomTextFormFeild(
                        prefixIcon:
                            SvgPicture.asset("assets/svgs/user_icon.svg"),
                        hint: "name",
                        upperText: "Name",
                      ),
                      CustomTextFormFeild(
                        controller: controller.emailController,
                        upperText: "Email Address",
                        prefixIcon:
                            SvgPicture.asset("assets/svgs/email_icon.svg"),
                        hint: "Email Address",
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
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                        ),
                        initialCountryCode: 'EG',
                      ),
                      CustomTextFormFeild(
                        prefixIcon:
                            SvgPicture.asset("assets/svgs/password_icon.svg"),
                        hint: "Password",
                        secure: true,
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined,
                            color: ColorsManager.icongrey),
                        upperText: "Password",
                      ),
                      CustomTextFormFeild(
                        prefixIcon:
                            SvgPicture.asset("assets/svgs/password_icon.svg"),
                        hint: "Password Confirmation",
                        secure: true,
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined,
                            color: ColorsManager.icongrey),
                        upperText: "Password",
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: controller.isChecked,
                            onChanged: (value) => controller.toggleCheckbox(),
                            activeColor: ColorsManager.mainblue,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(50), // Rounded checkbox
                            ),
                          ),
                          Text(
                            "I agree to",
                            style: TextStyles.font14blackWei400ght,
                          ),
                          Text(
                            " Terms & Condition",
                            style: TextStyles.font14Mainblue700Weight,
                          )
                        ],
                      ),
                      BlocBuilder<RegisterCubit, RegisterState>(
                        builder: (context, state) {
                          final controller =
                              BlocProvider.of<RegisterCubit>(context);
                          return CustomButton(
                            text: "Confirm",
                            onPressed: () {
                              MagicRouter.navigateTo(OtpPage(
                                email: controller.emailController.text,
                                title: "",
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => ResetPasswordDialog(
                                            mainText:
                                                'Your account has been successfully activated! You will now be automatically redirected to the homepage.',
                                            defaultText: 'Congratulations',
                                          ));
                                },
                              ));
                              showDialog(
                                context: context,
                                builder: (context) => ResetPasswordDialog(
                                  mainText:
                                      'Activation Code has been sent to your Email at ',
                                  email: controller.emailController.text,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}

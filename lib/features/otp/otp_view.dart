import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/shared_widgets/show_dialog.dart';
import 'package:yuki/core/shared_widgets/text_button.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/confirmpassword/confirmpassword_view.dart';
import 'package:yuki/features/reset_password/reset_password_cubit.dart';
import 'package:yuki/features/reset_password/reset_password_state.dart';

import 'otp_cubit.dart';
import 'otp_state.dart';

class OtpPage extends StatelessWidget {
  OtpPage({super.key,
    required this.email,
    required this.title,

    this.isForget});

   String email='';
  final String title;
  final bool? isForget;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OtpCubit()..email=email
      ,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<OtpCubit, OtpState>(
            builder: (context, state) {
              final controller =BlocProvider.of<OtpCubit>(context);
              return Form(
                key: controller.formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 20),
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
                            onPressed: () {},
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
                      isForget == true ? "Reset password" : "OTP",
                      style: TextStyles.font30Black700Weight,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Please check your email at         ",
                        style: TextStyles.font16Black300Weight,
                        children: [
                          TextSpan(
                              text: email,
                              style: TextStyles.font16Mainblue700Weight),
                          TextSpan(
                            text:
                            " to receive the password reset code. Kindly enter the code below to proceed.",
                            style: TextStyles.font16Black300Weight,
                          )
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/images/Lock.png",
                      width: 140.45.w,
                      height: 150.h,
                    ),
                    // OtpTextField(
                    //   numberOfFields: 6,
                    //   showFieldAsBox: true,
                    //
                    //   onCodeChanged: (String code) {controller.otpCode=code;
                    //
                    //
                    //     print("otpCode:${controller.otpCode}");},
                    //   fieldHeight: 50.h,
                    //   fillColor: ColorsManager.grey,
                    //   filled: true,
                    //   borderRadius: BorderRadius.circular(50.5),
                    //   decoration: InputDecoration(
                    //       fillColor: ColorsManager.grey, filled: true),
                    // ),
                    PinCodeTextField(

                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      animationDuration: Duration(milliseconds: 300),
                      // Pass it here
                      onChanged: (value) {

                    controller .otpCode= value;
                    }, appContext: context

                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    state is LoadingVerification ||
                        state is LoadingCheckCode?
                    const SpinKitThreeBounce(
                      color: ColorsManager.mainblue,
                      size: 26.0,
                    )
                        :
                    CustomButton(
                      child: Text(
                        "Confirm", style: TextStyles.font16White700Weight,),
                      // onPressed: () {
                      //   MagicRouter.navigateTo(const ConfirmpasswordPage());
                      // },
                      onPressed: (){
                        if (isForget == false)
                            controller.Verification(false);
                        else
                                controller.checkCode( true);



                      },
                    ),
                    CustomTextButton(
                      text: "Resend Code ?",
                      onpressed: () {},
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

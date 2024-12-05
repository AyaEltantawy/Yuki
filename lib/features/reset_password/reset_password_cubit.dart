import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yuki/core/app_storage/app_storage.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/user_model.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/show_dialog.dart';
import 'package:yuki/core/utils/utils.dart';
import 'package:yuki/features/login/login_state.dart';
import 'package:yuki/features/otp/otp_view.dart';

import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInit());

  final TextEditingController emailController = TextEditingController();
  String errorMessage = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool get isValidEmail {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(emailController.text);
  }

  ResetPassword() async {
    if (!formKey.currentState!.validate()) return;

    final body = {
      'email': emailController.text.toString(),
    };
    print('body ${body}');
    DioHelper.post("auth/forget", false, body: body).then((response) {
      final data = response.data as Map<String, dynamic>;
      print("dataaa $data");
      if (data['status'] == true) {
        if (isValidEmail) {
          MagicRouter.navigateTo(
              OtpPage(title: '',isForget: true,email:emailController.text.toString() ,));
        }
        showDialog(
            context: MagicRouter.currentContext,
            builder: (context) => ResetPasswordDialog(
                  email: emailController.text.toString(),
                  mainText: "Reset Code has been sent to your Email at ",
                ));
      } else {
        Utils.showSnackBar(data['message'], isError: true);
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuki/core/app_storage/app_storage.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/user_model.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/curved_navigation_bar.dart';
import 'package:yuki/core/shared_widgets/show_dialog.dart';
import 'package:yuki/core/utils/utils.dart';
import 'package:yuki/features/confirmpassword/confirmpassword_view.dart';

import 'package:yuki/features/otp/otp_view.dart';

import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpStateInit());
  String email = '';

  String otpCode = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Verification(bool isForget) async {
    final body = {'verification_code': otpCode};
    print('body ${body}');
    emit(LoadingVerification());
    DioHelper.post("auth/verify", false, body: body).then((response) {
      final data = response.data as Map<String, dynamic>;
      print("dataaa $data");
      print(email);
      if (data['status'] == true) {
        emit(LoadingSuccess());
        AppStorage.cacheUserInfo(UserModel.fromJson(data));

        Utils.showSnackBar(
          MagicRouter.currentContext,
          data['message'],
        );

        showDialog(
            context: MagicRouter.currentContext,
            builder: (context) => const ResetPasswordDialog(
                  mainText:
                      'Your account has been successfully activated! You will now be automatically redirected to the homepage.',
                  defaultText: 'Congratulations',
                ));
        //  MagicRouter.pop();
        MagicRouter.navigateTo(CustomCurvedNavigationBar());
      } else {
        emit(LoadingError());
        Utils.showSnackBar(
          MagicRouter.currentContext,
          data['message'],
        );
      }
    });
  }

  checkCode(bool isForget) async {
    isForget = true;
    final body = {'email': email, 'code': otpCode};
    print('email $email');

    print('body ${body}');
    emit(LoadingCheckCode());
    DioHelper.post("auth/forget/check", false, body: body).then((response) {
      final data = response.data as Map<String, dynamic>;

      print("dataaa $data");
      // print(data['message']);
      if (data['status'] == true) {
        emit(LoadingCheckSuccess());

        print('data ${data['data']}');
        //Utils.showSnackBar(MagicRouter.currentContext,data['data']as bool,);

        MagicRouter.navigateTo(ConfirmpasswordPage(email: email,otpCode:otpCode ,));
      } else {
        emit(LoadingCheckError());
        Utils.showSnackBar(
          MagicRouter.currentContext,
          data['message'],
        );
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuki/core/app_storage/app_storage.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/user_model.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/show_dialog.dart';
import 'package:yuki/core/utils/utils.dart';
import 'package:yuki/features/otp/otp_view.dart';

import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpState().init());
  TextEditingController emailController = TextEditingController();
  String otpCode = "";

  Verification() async {
    final body = {'verification_code': otpCode};
    print('body ${body}');
    DioHelper.post("auth/verify", false, body: body).then((response) {
      final data = response.data as Map<String, dynamic>;
      print("dataaa $data");
      if (data['status'] == true) {
        AppStorage.cacheUserInfo(UserModel.fromJson(data));

        //MagicRouter.navigateTo(CustomCurvedNavigationBar());
        // Utils.showSnackBar(data['message'],);

        showDialog(
            context: MagicRouter.currentContext,
            builder: (context) => const ResetPasswordDialog(
                  mainText:
                      'Your account has been successfully activated! You will now be automatically redirected to the homepage.',
                  defaultText: 'Congratulations',
                ));
      } else {
        Utils.showSnackBar(data['message'], isError: true);
      }
    });
  }
}

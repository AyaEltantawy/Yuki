import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/show_dialog.dart';
import 'package:yuki/core/utils/utils.dart';
import 'package:yuki/features/login/login_view.dart';

import 'confirmpassword_state.dart';

class ConfirmpasswordCubit extends Cubit<ConfirmpasswordState> {
  ConfirmpasswordCubit() : super(ConfirmpasswordStateInit());
  String email ='';
  String otpCode='';
final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController passwordController =TextEditingController();
  TextEditingController confirmPasswordController =TextEditingController();
  confirmPassword()async{
    final body = {'email': email, 'code': otpCode,'password':passwordController.text.toString()};
    print('email $email');

    print('body ${body}');
    emit(LoadingConfirm());
    DioHelper.post("auth/forget/reset", false, body: body).then((response) {
      final data = response.data as Map<String, dynamic>;

      print("dataaa $data");
      // print(data['message']);
      if (data['status'] == true) {
        emit(LoadingSuccess());
        showDialog(
            context: MagicRouter.currentContext,
            builder: (context) => ResetPasswordDialog(
       defaultText: 'Congratulations',
              mainText: "Reset Code has been sent to your Email at ",
            ));
        MagicRouter.navigateTo(LoginPage());
        print('data ${data['data']}');
        //Utils.showSnackBar(MagicRouter.currentContext,data['data']as bool,);


      } else {
        emit(LoadingError());
        Utils.showSnackBar(
          MagicRouter.currentContext,
          data['message'],
        );
      }
    });
  }






  }




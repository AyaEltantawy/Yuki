import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuki/core/app_storage/app_storage.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/user_model.dart';

import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/curved_navigation_bar.dart';
import 'package:yuki/core/shared_widgets/show_dialog.dart';
import 'package:yuki/core/utils/utils.dart';
import 'package:yuki/features/otp/otp_cubit.dart';
import 'package:yuki/features/otp/otp_view.dart';

import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterStateInit());
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  TextEditingController passwordConfirmationController =TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChecked = false;
  // NetworkState networkState = NetworkState.INITIAL;
  String gender = '';
  String phoneCode = 'eg';

  void toggleCheckbox() {
    isChecked = !isChecked;
    emit(CheckBoxUpdate());
  }

  Register() async {
    if (!formKey.currentState!.validate()) return;
    // networkState = NetworkState.LOADING;

    final token = await FirebaseMessaging.instance.getToken();
    final body = {
      'name': nameController.text.toString(),
      'phone':phoneController.text.toString(),
      'email':emailController.text.toString(),
      'password':passwordController.text.toString(),
      'type': Platform.isAndroid ? "web" : "iphone",
      'token':token,
      'gender':gender,
      'phonecode':phoneCode,

      'password_confirmation':passwordConfirmationController.text.toString(),
      'agree_terms':isChecked
    };
    print('body ${body}');
    emit( LoadingRegister());
    DioHelper.post("auth/register", false, body: body).then(

            await (response) {
      final data = response.data as Map<String, dynamic>;
      print("dataaa $data");
      if (data['status'] == true) {
        Utils.showSnackBar(MagicRouter.currentContext, data['message'],);
        AppStorage.cacheUserInfo(UserModel.fromJson(data));
emit(LoadingSuccess());
        //MagicRouter.navigateTo(CustomCurvedNavigationBar());
        Utils.showSnackBar(MagicRouter.currentContext,data['message'],);
        MagicRouter.navigateTo(OtpPage(
              email:emailController.text,isForget: false,
              title: "Otp Page", ));


              showDialog(
               context: MagicRouter.currentContext,
                builder: (context) => ResetPasswordDialog(
                 mainText:
                     'Activation Code has been sent to your Email at ',
               email: emailController.text,
               ));
            // );

      } else {
        emit(LoadingFailed());
        Utils.showSnackBar(MagicRouter.currentContext,data['message'],);
        // networkState = NetworkState.ERROR;
      }
    });
  }
  selectDropDownItem(){
    emit(SelectDropDownItem());
  }
}

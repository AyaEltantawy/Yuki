import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuki/core/app_storage/app_storage.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/user_model.dart';
import 'package:yuki/core/network_state/network_state.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/curved_navigation_bar.dart';
import 'package:yuki/core/shared_widgets/show_dialog.dart';
import 'package:yuki/core/utils/utils.dart';
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
  NetworkState networkState = NetworkState.INITIAL;
  String gender = '';
  String phoneCode = 'eg';

  void toggleCheckbox() {
    isChecked = !isChecked;
    emit(CheckBoxUpdate());
  }

  Register() async {
    if (!formKey.currentState!.validate()) return;
    networkState = NetworkState.LOADING;


    final body = {
      'name': nameController.text.toString(),
      'phone':phoneController.text.toString(),
      'email':emailController.text.toString(),
      'password':passwordController.text.toString(),
      'type': Platform.isAndroid ? "web" : "iphone",
      'token':"production",
      'gender':gender,
      'phonecode':phoneCode,

      'password_confirmation':passwordConfirmationController.text.toString(),
      'agree_terms':isChecked
    };
    print('body ${body}');
    DioHelper.post("auth/register", false, body: body).then((response) {
      final data = response.data as Map<String, dynamic>;
      print("dataaa $data");
      if (data['status'] == true) {
        AppStorage.cacheUserInfo(UserModel.fromJson(data));
        isLoading();
        //MagicRouter.navigateTo(CustomCurvedNavigationBar());
        Utils.showSnackBar(data['message'],);
        MagicRouter.navigateTo(OtpPage(
              email:emailController.text,
              title: "Otp Page", onPressed: () {  },));
            //    onPressed: () {
            //     showDialog(
            //         context: context,
            //         builder: (context) =>
            //             const ResetPasswordDialog(
            //              mainText:
            //                   'Your account has been successfully activated! You will now be automatically redirected to the homepage.',
            //                defaultText: 'Congratulations',
            //            ));},
            // ));
            //  showDialog(
            //    context: context,
            //    builder: (context) => ResetPasswordDialog(
            //     mainText:
            //         'Activation Code has been sent to your Email at ',
            //     email: emailController.text,
            //   ),
            // );
      } else {
        Utils.showSnackBar(data['message'], isError: true);
        networkState = NetworkState.ERROR;
      }
    });
  }
  selectDropDownItem(){
    emit(SelectDropDownItem());
  }
}

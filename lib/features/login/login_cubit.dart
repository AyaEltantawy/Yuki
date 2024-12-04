import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:yuki/core/app_storage/app_storage.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/user_model.dart';
import 'package:yuki/core/network_state/network_state.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/curved_navigation_bar.dart';
import 'package:yuki/core/utils/utils.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginStateInit());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  NetworkState networkState = NetworkState.INITIAL;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  update() {
    emit(Update());
  }

  Login() async {
    if (!formKey.currentState!.validate()) return;
    networkState = NetworkState.LOADING;
    update();

    final body = {
      'token': "qweweqw",
      'type': Platform.isAndroid ? "android" : "ios",
      'email': emailController.text.toString(),
      'password':passwordController.text.toString()
    };
    print('body ${body}');
    DioHelper.post("auth/login", false, body: body).then((response) {
      final data = response.data as Map<String, dynamic>;
      print("dataaa $data");
      if (data['status'] == true) {
        AppStorage.cacheUserInfo(UserModel.fromJson(data));
        networkState = NetworkState.SUCCESS;
        MagicRouter.navigateTo(CustomCurvedNavigationBar());
      } else {
        Utils.showSnackBar("data['msg']", isError: true);
        networkState = NetworkState.ERROR;
      }
    });
  }
}

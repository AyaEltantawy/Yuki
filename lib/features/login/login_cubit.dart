import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:yuki/core/app_storage/app_storage.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/user_model.dart';

import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/curved_navigation_bar.dart';
import 'package:yuki/core/utils/utils.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginStateInit()) {}

//void saveFirebaseToken(String token)async{await FirebaseFirestore.instance.collection("UserTokens").doc("User2").set()}
//

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Login() async {
    if (!formKey.currentState!.validate()) return;
emit(LoadingLogin());
    final token = await FirebaseMessaging.instance.getToken();
    final body = {
      'token': token,
      'type': Platform.isAndroid ? "android" : "ios",
      'email': emailController.text.toString(),
      'password': passwordController.text.toString()
    };
    print('body ${body}');
    DioHelper.post("auth/login", false, body: body).then((response) {
      final data = response.data as Map<String, dynamic>;
      print("dataaa $data");
      print(' jdshjhfdsjbdsj${data['message']}');

      if (data['status'] == true) {
        Utils.showSnackBar(MagicRouter.currentContext, data['message'],);
        AppStorage.cacheUserInfo(UserModel.fromJson(data));

        emit(LoadingSuccess());

        MagicRouter.navigateTo(CustomCurvedNavigationBar());

      } else {
        Utils.showSnackBar(MagicRouter.currentContext, data['message'], );
       emit(LoadingError());
      }
    });
  }
}

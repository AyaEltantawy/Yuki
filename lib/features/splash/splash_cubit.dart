import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:yuki/core/app_storage/app_storage.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/features/auth/login/login_view.dart';
import 'package:yuki/features/bottom_nav_bar/bottom_nav_bar_view.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState().init());
  String? token = AppStorage.getToken;

  navigate() {
    Future.delayed(const Duration(seconds: 3), () {
      token != null && token != ""
          ? MagicRouter.navigateTo(const BottomNavBarPage())
          : MagicRouter.navigateTo(const LoginPage());
    });
  }
}

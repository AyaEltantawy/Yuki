import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:yuki/core/app_storage/app_storage.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/curved_navigation_bar.dart';
import 'package:yuki/features/login/login_view.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState().init());
  String? token = AppStorage.getToken;

  navigate() {
    Future.delayed(Duration(seconds: 3), () {
      token != null && token != ""
          ? MagicRouter.navigateTo(CustomCurvedNavigationBar())
          : MagicRouter.navigateTo(LoginPage());
    });
  }
}

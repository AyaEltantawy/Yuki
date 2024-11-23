import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/features/login/login_view.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState().init());
  navigate() {


    Future.delayed(Duration(seconds: 3), () {
    MagicRouter.navigateTo(LoginPage());
    });

}
}

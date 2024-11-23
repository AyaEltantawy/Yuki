import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'splash_cubit.dart';
import 'splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (BuildContext context) => SplashCubit()..navigate(),
      child: Scaffold(
        body: Center(
          child: SvgPicture.asset(
            "assets/svgs/logo.svg",
            width: 224.w,
            height: 228.05.h,
          ),
        ),
      ),
    );
  }
}

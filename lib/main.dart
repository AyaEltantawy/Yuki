import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/features/register/register_view.dart';
import 'package:yuki/features/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yuki',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: ColorsManager.mainblue),
        navigatorKey: navigatorKey,
        home: SplashPage(),
      ),
    );
  }
}

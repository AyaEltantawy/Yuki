import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yuki/core/app_storage/app_storage.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/features/register/register_view.dart';
import 'package:yuki/features/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';

main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String? token = AppStorage.getToken;

  MyApp({super.key});

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
        initialRoute: '/',

        navigatorKey: navigatorKey,
        home: SplashPage(),
      ),
    );
  }
}

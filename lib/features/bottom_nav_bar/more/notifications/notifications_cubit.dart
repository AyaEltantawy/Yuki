import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/notifications_response.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/features/bottom_nav_bar/more/notifications/notifications_view.dart';

import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsStateInit()) {
    fetchNotifications();
    initNotifications();
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  NotificationsResponse? notificationsResponse;
  List<Items>? items;

  fetchNotifications() async {
    emit(FetchNotificationsLoadingState());
    final response = await DioHelper.get("notifications");
    final data = response!.data as Map<String, dynamic>;
    if (data['status'] == true) {
      notificationsResponse = NotificationsResponse.fromJson(data);
      items = notificationsResponse?.data?.items;
      emit(FetchNotificationsSuccessState());
    } else {
      emit(FetchNotificationsErrorState());
    }
  }

  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    String? token = await _firebaseMessaging.getToken();
    print("Token $token");
    handleBackgroundMessage();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    MagicRouter.navigateTo(NotificationsPage(), arguments: message);
  }

  Future? handleBackgroundMessage() {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  }

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
// static Future initialize (FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin )async{
//
// var androidInitialize =new AndroidInitializationSettings('');
// var iOSInitialize =new IOSInitializationSettings();
// var initializationsSettings = new InitializationSettings(android: androidInitialize,iOS:iOSInitialize);
// await flutterLocalNotificationsPlugin.initialize(initializationsSettings);
//
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuki/core/theming/colors.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
GlobalKey<ScaffoldMessengerState>();

class Utils {
  static void showSnackBar(String message, {bool isError = false}) {
    Get.snackbar(
      '',
      message,
      titleText: Container(),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      backgroundColor: isError ? Colors.red.shade900 :ColorsManager.mainblue,
      colorText: Colors.white,
      borderRadius: 12,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    );
  }

  static void showBottomSheet({
    required Widget child,
  }) async {
    await Get.bottomSheet(
      child,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
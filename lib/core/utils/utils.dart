import 'package:flutter/material.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class Utils {

  static void showSnackBar(BuildContext context, String msg, ) {
    final snackBar = SnackBar(
      backgroundColor: ColorsManager.mainblue,
      content: Text(
        msg,
        style: TextStyles.font15White700Weight,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

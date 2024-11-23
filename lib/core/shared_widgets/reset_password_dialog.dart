import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/theming/styles.dart';

class ResetPasswordDialog extends StatelessWidget {
  final String? defaultText;
  final String? email;
  final String mainText;

  const ResetPasswordDialog(
      {super.key, this.email, this.defaultText, required this.mainText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Optional: Rounded corners
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/correct.png",
            width: 160.w,
            height: 160.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(defaultText ?? "", style: TextStyles.font18Mainblue700Weight,),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: mainText,
                style: TextStyles.font13Black400Weight,
                children: [
                  TextSpan(text: email ?? "",
                      style: TextStyles.font14Mainblue700Weight)
                ],
              )
          ),
        ],
      ),
    );
  }
}

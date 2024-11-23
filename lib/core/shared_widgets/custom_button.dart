import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPressed});

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
            colors: [Color(0xff020659), Color(0xff031780)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.14, 0.4]),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.font16White700Weight,
        ),
      ),
    );
  }
}

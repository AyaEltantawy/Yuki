import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/theming/colors.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {super.key,
      required this.text,
      required this.onpressed,
      this.fontWeight,
      this.textDecoration,
      this.alignment,
      this.color,
      this.fontsize});

  String text;
  final VoidCallback onpressed;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final Alignment? alignment;
  final Color? color;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(alignment: alignment),
      onPressed: onpressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontsize ?? 13.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          decoration: textDecoration ?? TextDecoration.underline,
          decorationColor: ColorsManager.mainblue,
          color: color ?? ColorsManager.mainblue,
        ),
      ),
    );
  }
}

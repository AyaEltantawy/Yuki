import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/theming/colors.dart';

class CategoryContainer extends StatelessWidget {
  CategoryContainer({super.key,  required this.title, required this.textStyle,required this.isSelected,required this .change}) {}
// final VoidCallback onTap;
  final String title;
  final TextStyle textStyle;
 final bool change;
final bool  isSelected;
  @override
  Widget build(BuildContext context) {
    return  Container(


    decoration: BoxDecoration(
      // boxShadow:[
      //
      //     BoxShadow(
      //       color: ColorsManager.grey.withOpacity(0.1),
      //       blurRadius: 48,
      //       spreadRadius: 4,
      //       offset: const Offset(1, 1),
      //     ),
      //   ],


      borderRadius: BorderRadius.circular(5), color:isSelected? ColorsManager.mainblue :ColorsManager.grey),

    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(title,style: textStyle,textAlign: TextAlign.center,),
    ),
    );
  }
}

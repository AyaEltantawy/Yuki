import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class CategoryContainer extends StatelessWidget {
  CategoryContainer({
    super.key,
    required this.title,
    required this.isSelected,
    this.height,
    required this.horizontal,
    required this.vertical,
    required this.radius, this.onTap,
  }) {}

// final VoidCallback onTap;
  final String title;

  //final bool change;
  final bool isSelected;
  final double? height;
  final double horizontal;
  final double vertical;
  final double radius;
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: isSelected ? ColorsManager.mainblue : ColorsManager.grey),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
          child: Text(
            title,

            style: isSelected
                ? TextStyles.font13Textgrey700Weight
                : TextStyles.font13Black400Weight,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

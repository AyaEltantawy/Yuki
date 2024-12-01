import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class CustomCheckboxAndText extends StatefulWidget {
  CustomCheckboxAndText({super.key, required this.paymentMethodName});

  bool isChecked = false;
final String paymentMethodName;
  @override
  State<CustomCheckboxAndText> createState() => _CustomCheckboxAndTextState();
}

class _CustomCheckboxAndTextState extends State<CustomCheckboxAndText> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SizedBox(width: 24.w,

          height: 24.w,
          child: Checkbox(
            shape:OvalBorder(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              activeColor: ColorsManager.mainblue,
              value: widget.isChecked,
              onChanged: (value) {
                widget.isChecked = !widget.isChecked;
                setState(() {});
              }),
        ),
      ),
      Text(widget.paymentMethodName,style: TextStyles.font15Black400Weight,)
    ]);
  }
}

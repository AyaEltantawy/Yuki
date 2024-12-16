import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class DropDownButton extends StatelessWidget {
  final String upperText;
  bool dropdownValue = true;
  String? selectedItem;
final String hintText;
  void Function(Object?)? onChanged;
  final List<String> dropDownItems;
  DropDownButton({super.key, required this.upperText, required this.hintText ,required this.dropDownItems,this.onChanged,this.selectedItem});



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(upperText, style: TextStyles.font14blackWei400ght),
        SizedBox(
          height: 10.h,
        ),
        Container(
          decoration: BoxDecoration(
              color: ColorsManager.lightgrey,
              borderRadius: BorderRadius.circular(5)),
          child: DropdownButton(

            hint: Text(
              hintText,
              style: TextStyles.font13Icongrey400Weight,
            ),
            underline: const SizedBox(),
            isExpanded: true,
            value: selectedItem,
            items: dropDownItems.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,

            icon: const Icon(Icons.arrow_drop_down,color:ColorsManager.black),
          ),
        )
      ],
    );
  }
}

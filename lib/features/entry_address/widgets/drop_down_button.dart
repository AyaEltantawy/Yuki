import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class DropDownButton extends StatelessWidget {
  final String upperText;
  bool dropdownValue = true;
  String? _selectedItem;
final String hintText;
  DropDownButton({super.key, required this.upperText, required this.hintText});

  List<String> _dropDownItems = ['Egypt', "Saudi", "Oman"];

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
            underline: SizedBox(),
            isExpanded: true,
            value: _selectedItem,
            items: _dropDownItems.map((String item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),
            onChanged: (Object? value) {},
            icon: Icon(Icons.arrow_drop_down,color:ColorsManager.black),
          ),
        )
      ],
    );
  }
}

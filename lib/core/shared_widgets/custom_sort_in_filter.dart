import 'package:flutter/material.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';


class CustomSortInFilter extends StatefulWidget {
 CustomSortInFilter({super.key, required this.filterName});
final String filterName;

  @override
  State<CustomSortInFilter> createState() => _CustomSortInFilterState();
}

class _CustomSortInFilterState extends State<CustomSortInFilter> {
  bool isChecked = false; // Initial state is unchecked

  void toggleCheckbox() {
    isChecked = !isChecked; // Toggle the value
setState(() {

});
  }
  @override
  Widget build(BuildContext context) {

    return  Row(

      mainAxisAlignment:MainAxisAlignment.spaceBetween,

      children: [Text(widget.filterName,style: TextStyles.font13Black400Weight,),
      Checkbox(value:isChecked,  onChanged: (value) =>toggleCheckbox(),activeColor: ColorsManager.mainblue,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(50), // Rounded checkbox
        ),

    )


      ],);
  }
}

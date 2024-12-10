import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/shared_widgets/custom_sort_in_filter.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class FilterButtomSheet extends StatelessWidget {
  const FilterButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Colors.white),
      child: ListView(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: ColorsManager.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      indent: 135,
                      endIndent: 135,
                      thickness: 3,
                      color: ColorsManager.fivegrey,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text(
                        "Filter",
                        style: TextStyles.font15Black700Weight,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Text(
                        "Filter & Sort Products",
                        style: TextStyles.font13Textgrey300Weight,
                      ),
                    )
                  ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Filter By Price",
                  style: TextStyles.font13black700Weight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextFormFeild(
                        upperText: "Min Price",
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: CustomTextFormFeild(
                        upperText: "Max Price",
                      ),
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: ColorsManager.bordergrey,
                ),
                Text(
                  "Sort By",
                  style: TextStyles.font13black700Weight,
                ),
                CustomSortInFilter(
                  filterName: 'Price (Low to High)',
                ),
                CustomSortInFilter(
                  filterName: 'Price (High to low)',
                ),
                CustomSortInFilter(
                  filterName: 'Alphabetically ( From A to Z )',
                ),
                CustomSortInFilter(
                  filterName: 'Alphabetically ( From Z to A )',
                ),
                CustomSortInFilter(
                  filterName: 'Alphabetically ( From Z to A )',
                ),
                CustomSortInFilter(
                  filterName: 'Oldest to newest',
                ),
                CustomButton(child: Text("Apply",style: TextStyles.font16White700Weight,),)
              ],
            ),
          )
        ],
      ),
    );
  }
}

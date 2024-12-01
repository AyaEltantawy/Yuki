import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class AddressCard extends StatefulWidget {
  const AddressCard({super.key,  this.border, required this.addressName, required this.choose});
final BoxBorder? border;
final String addressName;
final bool choose ;
  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  bool isChecked = false;
  bool isDefault = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: widget.border,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 48,
              spreadRadius: 0,
              color: Color(0xff0000000D),

            )
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                    "assets/svgs/address_icon_without_background.svg"),
                SizedBox(width: 10.w),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                    widget.addressName  ,
                        style: TextStyles.font13black700Weight,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Mansoura",
                            style: TextStyles.font13Black400Weight,
                            children: [
                              TextSpan(
                                text: ",\n",
                                style: TextStyles.font13Black400Weight,
                              ),
                              TextSpan(
                                  text:
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                                  style: TextStyles.font12Icongrey300Weight)
                            ]),
                      ),
                    ],
                  ),
                ),
     widget.choose == true?           Row(
                  children: [
                    SizedBox(
                      width: 22.w,
                      height: 22.w,

                      child: Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          isChecked = !isChecked;
                          setState(() {});
                        },
                        side: BorderSide(width: 1,color: ColorsManager.mainblue),
                        activeColor: ColorsManager.mainblue,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),


                SizedBox(
                  width: 2.w,
                ),
                Text("Choose Address", style: TextStyles.font12Black400Weight)
              ],
            ) :Row(),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const Divider(
              thickness: 1,
              color: ColorsManager.bordergrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                        "assets/svgs/delete_icon_in_address_page.svg"),
                    SizedBox(width: 10.w),
                    SvgPicture.asset("assets/svgs/rounded_edit_icon.svg")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: isDefault,
                        groupValue: true,
                        onChanged: (value) {
                          isDefault = !isDefault;
                          setState(() {});
                        },
fillColor: WidgetStateProperty.all(ColorsManager.mainblue),
                       activeColor: ColorsManager.mainblue,
                      visualDensity: VisualDensity.compact,

                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap ,
                    ),
                    Text(isDefault == true? "Default Address":"Set As A Default Address ",style:TextStyles.font11Black300Weight)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

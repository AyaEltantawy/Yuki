import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class NewArrivalAndFeatures extends StatelessWidget {
  bool isArrival;
  String  svgUrl;
String text;
double radius;
  final VoidCallback updateArrivalsAndFeatured;

  NewArrivalAndFeatures(

      {super.key,
      required this.isArrival,
        required this.svgUrl,
      required this.updateArrivalsAndFeatured,
      required this.text
        ,required this.radius
      });

  @override
  Widget build(BuildContext context) {
    return

        Expanded(
          child: GestureDetector(
            onTap: updateArrivalsAndFeatured,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: isArrival ? ColorsManager.mainblue : ColorsManager.grey,
              ),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.asset(svgUrl),
                SizedBox(
                  width: 10.w,
                ),
                    //
                   // "New Arrivals"
                Text(
                 text ,
                  style: isArrival
                      ? TextStyles.font14White700Weight
                      : TextStyles.font14blackWei400ght,
                )
              ]),
            ),
          ),
        );
        // Expanded(
        //     child: GestureDetector(
        //   onTap: updateArrivalsAndFeatured,
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(vertical: 10),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10),
        //       color: isArrival ? ColorsManager.grey : ColorsManager.mainblue,
        //     ),
        //     child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        //       SvgPicture.asset("assets/svgs/Star Shine.svg"),
        //       SizedBox(
        //         width: 10.w,
        //       ),
        //       Text(
        //         "Featured",
        //         style: isArrival
        //             ? TextStyles.font14blackWei400ght
        //             : TextStyles.font14White700Weight,
        //       )
        //     ]),
        //   ),
        // )),

  }
}

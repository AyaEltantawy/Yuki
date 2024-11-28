import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class ReviewBottomSheet extends StatefulWidget {
  const ReviewBottomSheet({super.key});

  @override
  State<ReviewBottomSheet> createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends State<ReviewBottomSheet> {
  @override
  Widget build(BuildContext context) {
    bool isPressed = false;
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              indent: 150,
              endIndent: 150,
              thickness: 3,
              color: ColorsManager.fivegrey,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Rate Product",
              style: TextStyles.font18Black700Weight,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      isPressed = !isPressed;
                      setState(() {});
                    },
                    child: isPressed == false
                        ? SvgPicture.asset("assets/svgs/grey_star.svg")
                        : SvgPicture.asset("assets/svgs/golden_star.svg")),
                GestureDetector(
                    onTap: () {
                      isPressed = !isPressed;
                      setState(() {});
                    },
                    child: isPressed
                        ? SvgPicture.asset("assets/svgs/grey_star.svg")
                        : SvgPicture.asset("assets/svgs/golden_star.svg")),
                GestureDetector(
                    onTap: () {
                      isPressed = !isPressed;
                      setState(() {});
                    },
                    child: isPressed
                        ? SvgPicture.asset("assets/svgs/grey_star.svg")
                        : SvgPicture.asset("assets/svgs/golden_star.svg")),
                GestureDetector(
                    onTap: () {
                      isPressed = !isPressed;
                      setState(() {});
                    },
                    child: isPressed
                        ? SvgPicture.asset("assets/svgs/grey_star.svg")
                        : SvgPicture.asset("assets/svgs/golden_star.svg")),
                GestureDetector(
                    onTap: () {
                      isPressed = !isPressed;
                      setState(() {});
                    },
                    child: isPressed
                        ? SvgPicture.asset("assets/svgs/grey_star.svg")
                        : SvgPicture.asset("assets/svgs/golden_star.svg")),
              ],
            ),
            //Text("Share Your Experience",style: TextStyles.,)
          ],
        ));
  }
}

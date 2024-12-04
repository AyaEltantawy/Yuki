import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/category_container.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/product_details/product_details_view.dart';

class SetReviewBottomSheet extends StatefulWidget {
  SetReviewBottomSheet({
    super.key,
   required  this.rateAmount,
    this.reviewText,
  });

  double rateAmount;
  final String? reviewText;

  @override
  State<SetReviewBottomSheet> createState() => _SetReviewBottomSheetState();
}

class _SetReviewBottomSheetState extends State<SetReviewBottomSheet> {
  TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(20)),
      child: SafeArea(
        child: ListView(shrinkWrap:true ,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          scrollDirection: Axis.vertical,
          children: [
            const Divider(
              indent: 137,
              endIndent: 137,
              thickness: 3,
              color: ColorsManager.fivegrey,
            ),
            Text(
              "Rate Product",
              style: TextStyles.font18Black700Weight,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Did you like the Product ?",
              style: TextStyles.font13Greyblack300Weight,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 10.h),
              child: RatingBar.builder(
                maxRating: 5,
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  widget.rateAmount = rating;
                  // print(rating);
                  print(widget.rateAmount);
                },
              ),
            ),
            CustomTextFormFeild(maxLines: 2,
              upperText: "Share Your Experience",
              prefixIcon: Padding(
                padding: EdgeInsets.only(bottom:25.h),
                child: Image.asset("assets/images/Pen 2.png"),
              ),
              hint: "Share your experince with us",
              fillColor: ColorsManager.grey,
              controller: reviewController,
            ),
            SizedBox(
              height: 20.h,
            ),

            //CategoryContainer(title: "Rate", isSelected: true, horizontal: 10.w, vertical: 10.h, radius:5)

            StatefulBuilder(builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      child: Text( "Rate",style: TextStyles.font16White700Weight,),
                      onPressed: () {
                        setState(() {
                          MagicRouter.navigateTo(ProductdetailsPage(
                            rateAmount: widget.rateAmount,
                            reviewText: reviewController.text.toString(),
                          ));
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(
                              color: ColorsManager.seconderyblue, width: .5),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 15,
                                spreadRadius: 0,
                                color: Color(0xff0000000A))
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 13.h),
                        child: Text(
                          "Back",
                          textAlign: TextAlign.center,
                          style: TextStyles.font13Secondaryblue400Weight,
                        ),
                      ),
                    ),
                  )
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}

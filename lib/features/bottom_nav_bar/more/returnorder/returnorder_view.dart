import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/shared_widgets/shopping_cart.dart';
import 'package:yuki/core/shared_widgets/show_dialog.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'returnorder_cubit.dart';
import 'returnorder_state.dart';

class ReturnorderPage extends StatelessWidget {
  final String? orderStatus;
  final String? firstButtonText;

  final String? secondButtonText;
  final VoidCallback? onPressed;

  const ReturnorderPage(
      {super.key,
      this.orderStatus,
      this.firstButtonText,
      this.secondButtonText,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ReturnorderCubit(),
        child: Scaffold(body: SafeArea(child:
            BlocBuilder<ReturnorderCubit, ReturnorderState>(
                builder: (context, state) {
          final controller = BlocProvider.of<ReturnorderCubit>(context);
          return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/back_arow.png"),
                    SvgPicture.asset(
                      "assets/svgs/cart_icon.svg",
                      width: 45.w,
                      height: 45.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Return Order",
                  style: TextStyles.font20black700Weight,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Order No. #1236582",
                  style: TextStyles.font15Thirdgrey300Weight,
                ),
                const Divider(
                  thickness: 1,
                  color: ColorsManager.mainblue,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: ColorsManager.grey,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 48,
                            spreadRadius: 0,
                            color: Color(0xff0000000D))
                      ]),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: 20.h, bottom: 20.h, end: 170.w, start: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Order no. : ",
                              style: TextStyles.font13Icongrey400Weight,
                              children: [
                                TextSpan(
                                    text: "#46679797",
                                    style: TextStyles.font13black700Weight),
                              ]),
                        ),
                        SizedBox(height: 10.h),
                        RichText(
                          text: TextSpan(
                              text: "Order Status : ",
                              style: TextStyles.font13Icongrey400Weight,
                              children: [
                                TextSpan(
                                    text: orderStatus ?? "In Review",
                                    style: orderStatus == "Accepted" ||
                                            orderStatus == "Delivered"
                                        ? TextStyles.Font13Stronggreen700Weight
                                        : TextStyles.font13black700Weight),
                              ]),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Sunday , 12 Nov 2023",
                          style: TextStyles.font13Icongrey400Weight,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text("Choose Products you want to return",
                    style: TextStyles.font15Black700Weight),
                SizedBox(
                  height: 15.h,
                ),
                ShoppingCart(
count: controller.count,
                  increament: controller.increament,
              decreament: controller.decreament,
                  isDelete: false,
                ),
                SizedBox(height: 10.h),
                ShoppingCart(
                  count: controller.count,
                  increament: controller.increament,
                  decreament: controller.decreament,
                  isDelete: false,
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Divider(
                  thickness: 1,
                  color: ColorsManager.bordergrey,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormFeild(
                  maxLines: 2,
                  upperText: "Return Reason",
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(bottom: 25.h),
                    child: Image.asset("assets/images/Pen 2.png"),
                  ),
                  hint: "Mention the return reason",
                  fillColor: Colors.white,
                ),
                const Divider(
                  thickness: 1,
                  color: ColorsManager.bordergrey,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text("Attach Image(s)", style: TextStyles.font15Black700Weight),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 48,
                            spreadRadius: 0,
                            offset: Offset(0, 2),
                            color: Color(0xff0000000D))
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svgs/Path.svg"),
                        const VerticalDivider(
                          thickness: 1,
                          color: ColorsManager.bordergrey,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Attach image or more\n",
                                style: TextStyles.font13Black400Weight,
                                children: [
                              TextSpan(
                                  text: "Pdf , Png , Jpg , Jpeg",
                                  style: TextStyles.font12Icongrey400Weight)
                            ]))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                CustomButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => const ResetPasswordDialog(
                                mainText: 'تم ارسال طلب الارجاع بنجاح',
                              ));
                    },
                    child:
                        Text("Return", style: TextStyles.font16White700Weight))
              ]);
        }))));
  }
}

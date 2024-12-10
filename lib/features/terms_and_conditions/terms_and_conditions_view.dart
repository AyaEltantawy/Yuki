import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

import 'terms_and_conditions_cubit.dart';
import 'terms_and_conditions_state.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TermsAndConditionsCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<TermsAndConditionsCubit, TermsAndConditionsState>(
            builder: (context, state) {
              final controller =
                  BlocProvider.of<TermsAndConditionsCubit>(context);
              return state is PolicyLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : state is PolicyErrorState
                      ? const Text("error")
                      : ListView(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 20.w),
                          children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset("assets/images/back_arow.png"),
                                  SvgPicture.asset(
                                    "assets/svgs/logo.svg",
                                    width: 50.w,
                                    height: 50.w,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "Terms & Conditions",
                                style: TextStyles.font20black700Weight,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Take a look at App terms and conditions",
                                style: TextStyles.font15Thirdgrey300Weight,
                              ),
                              const Divider(
                                thickness: 1,
                                color: ColorsManager.mainblue,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                Bidi.stripHtmlIfNeeded(
                                    controller.refundPolicy ?? ""),
                                textAlign: TextAlign.end,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                Bidi.stripHtmlIfNeeded(
                                    controller.privacyPolicy ?? ""),
                                textAlign: TextAlign.end,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                Bidi.stripHtmlIfNeeded(
                                    controller.shippingPolicy ?? ""),
                                textAlign: TextAlign.end,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                Bidi.stripHtmlIfNeeded(
                                    controller.termsOfService ?? ""),
                                textAlign: TextAlign.end,
                              ),
                            ]);
            },
          ),
        ),
      ),
    );
  }
}

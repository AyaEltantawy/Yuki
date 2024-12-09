import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

import 'about_the_app_cubit.dart';
import 'about_the_app_state.dart';

class AboutTheAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AboutTheAppCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<AboutTheAppCubit, AboutTheAppState>(
            builder: (context, state) {
              final controller = BlocProvider.of<AboutTheAppCubit>(context);

              return state is AboutUsLoadingState
                  ? Center(child: const CircularProgressIndicator())
                  : state is AboutUsErrorState
                      ? const Text("error")
                      : ListView(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 20.w),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              "About the application",
                              style: TextStyles.font20black700Weight,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Information about the application",
                              style: TextStyles.font15Thirdgrey300Weight,
                            ),
                            const Divider(
                              thickness: 1,
                              color: ColorsManager.mainblue,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(controller
                                    .aboutUsModel?.section1?.description ??
                                '')
                          ],
                        );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

import 'add_new_address_cubit.dart';
import 'add_new_address_state.dart';

class AddNewAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNewAddressCubit(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
              SizedBox(height: 10.h,),
              Text(
                "Add new address",
                style: TextStyles.font20black700Weight,
              ),
              SizedBox(height: 10.h,),
              const CustomTextFormFeild(
                hint: "Search for address",
                hintColor: ColorsManager.icongrey,
                prefixIcon:
                Icon(Icons.search, color: ColorsManager.mainblue),
                fillColor: ColorsManager.grey,
              ),
              SizedBox(height: 20.h,),

            ],
          ),
        ),
      ),
    );
  }
}

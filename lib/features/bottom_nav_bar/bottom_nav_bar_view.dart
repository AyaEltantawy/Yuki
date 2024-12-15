import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/theming/colors.dart';

import 'bottom_nav_bar_cubit.dart';
import 'bottom_nav_bar_state.dart';

class BottomNavBarPage extends StatelessWidget {
  const BottomNavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => BottomNavBarCubit(),
        child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
          builder: (context, state) {
            final controller = BlocProvider.of<BottomNavBarCubit>(context);
            return Scaffold(
                body: controller.screens[controller.index],
                bottomNavigationBar: CurvedNavigationBar(
                  key: controller.navigationKey,
                  // Use the correct key here

                  items: controller.items,
                  backgroundColor: Colors.transparent,
                  index: controller.index,
                  animationDuration: const Duration(milliseconds: 600),
                  // Adjusted for smoother animation
                  height: 75.h,
                  onTap: (index) => controller.updateIndex(index),
                  buttonBackgroundColor: ColorsManager.mainblue,
                  animationCurve: Curves.decelerate,
                  color: Colors.white,
                ));
          },
        ));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/custom_address_details.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/entry_address/entry_address_view.dart';

import 'add_new_address_cubit.dart';
import 'add_new_address_state.dart';

class AddNewAddressPage extends StatelessWidget {
  //LatLng myCurrentLocation = const LatLng(31.037933, 31.381523);
  GoogleMapController? gmc;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.037933, 31.381523),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  //static const CameraPosition _kGooglePlex= CameraPosition(target:LatLng(31.037933, 31.381523),zoom: 14);
  Set<Marker> myMarker = {
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(31.037933, 31.381523),
        draggable: true)
  };

  AddNewAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNewAddressCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<AddNewAddressCubit, AddNewAddressState>(
            builder: (context, state) {
              final controller = BlocProvider.of<AddNewAddressCubit>(context);
              return ListView(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    child: Row(
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
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "Add new address",
                      style: TextStyles.font20black700Weight,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const CustomTextFormFeild(
                      hint: "Search for address",
                      hintColor: ColorsManager.icongrey,
                      prefixIcon:
                          Icon(Icons.search, color: ColorsManager.mainblue),
                      fillColor: ColorsManager.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, -4),
                              blurRadius: 4,
                              spreadRadius: 0,
                              color: Color(0xff2020200A))
                        ]),
                    child: Stack(
                      children: [
                        GoogleMap(
                          compassEnabled: true,
                          //  mapType: MapType. normal,
                          initialCameraPosition: _kGooglePlex,
                          onMapCreated: (GoogleMapController controller) {
                            gmc = controller;
                          },
                          markers: myMarker,
                          onTap: (latling) {
                            myMarker.remove(const Marker(markerId: MarkerId("1")));
                            myMarker.add(Marker(
                                markerId: MarkerId("1"), position: latling));
                            controller.changeMarkerPosition();
                          },
                        ),
                        Positioned(
                          bottom: 320.h,
                          left: 30.w,
                          right: 30.w,
                          child:const CustomAddressDetails()
                        ),
                        Positioned(
                            bottom: 260.h,
                            left: 30.w,
                            right: 30.w,
                            child: CustomButton(
                              onPressed: () {
                                MagicRouter.navigateTo(EntryAddressPage());
                              },
                              child: Text("Confirm",
                                  style: TextStyles.font16White700Weight),
                            ))
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

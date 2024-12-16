import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/shared_widgets/custom_button.dart';
import 'package:yuki/core/shared_widgets/custom_text_form_feild.dart';
import 'package:yuki/core/theming/styles.dart';
import 'package:yuki/features/bottom_nav_bar/more/more_address/add_new_address/add_new_address_view.dart';
import 'package:yuki/features/bottom_nav_bar/more/more_address/entry_address/widgets/custom_entry_address_container.dart';
import 'package:yuki/features/bottom_nav_bar/more/more_address/entry_address/widgets/drop_down_button.dart';
import 'entry_address_cubit.dart';
import 'entry_address_state.dart';

class EntryAddressPage extends StatelessWidget {
  const EntryAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => EntryAddressCubit(),
        child: Scaffold(
          body: SafeArea(
            child: BlocBuilder<EntryAddressCubit, EntryAddressState>(
              builder: (context, state) {
                final controller = BlocProvider.of<EntryAddressCubit>(context);
                return ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                      "Delivery Addresses",
                      style: TextStyles.font20black700Weight,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Your Delivery Addresses list",
                      style: TextStyles.font15Thirdgrey300Weight,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          child: InkWell(
                              onTap: () {
                                MagicRouter.navigateTo(AddNewAddressPage());
                              },
                              child: Image.asset(
                                  "assets/images/Basemap image.png")),
                        ),
                        Positioned(
                            top: 60.h,
                            right: 50.w,
                            left: 60.w,
                            child: SvgPicture.asset("assets/svgs/marker.svg")),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Choose Address Type",
                        style: TextStyles.font13Secondblack700Weight),
                    SizedBox(
                      height: 10.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(3, (index) {
                        final titels = ["Home", "Work", "Extra"];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: CustomEntryAddressContainer(
                            text: titels[index],
                            onTap: () {
                              // controller.selectContainer();
                              controller.updateActiveIndex(index);
                            },
                            isSelected: controller.activeIndex == index,
                          ),
                        );
                      })),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: state is CountriesLoaingState
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : state is CountryErrorState
                                    ? const Text("Error")
                                    : DropDownButton(

                                        dropDownItems: List.generate(
                                            controller.countriesResponse?.data
                                                    ?.length ??
                                                0, (index) {
                                          return controller.countriesResponse
                                                  ?.data?[index].name ??
                                              '';
                                        }),
                                        onChanged: (value) {
                                          controller
                                              .updateCountry(value.toString());
                                          for (int i = 1;
                                              i <
                                                  (controller.countriesResponse
                                                          ?.data?.length ??
                                                      0);
                                              i++) {
                                            controller.updateEachCountryCities(
                                                controller.countriesResponse
                                                    ?.data?[i].id);
                                          }
                                        },
                                        selectedItem:
                                            controller.selectedCountryItem,
                                        upperText: "Country",
                                        hintText: ' Select your country ...',
                                      )),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: state is CitiesLoaingState
                              ? const Center(child: CircularProgressIndicator())
                              : state is CitiesErrorState
                                  ? const Text("Error")
                                  : DropDownButton(
                                      upperText: "City",
                                      hintText: ' Select your City ...',
                                      selectedItem: controller.selectedCityItem,
                                      onChanged: (value) {
                                        controller.updateCity(value.toString());
                                      },
                                      dropDownItems: List.generate(
                                          controller.citiesResponse?.data
                                                  ?.length ??
                                              0, (index) {
                                        return controller.citiesResponse
                                                ?.data?[index].name ??
                                            "";
                                      }),
                                    ),
                        ),
                      ],
                    ),
                    const CustomTextFormFeild(
                        upperText: "Postal Code",
                        hint: "Type postal code ...",
                        radius: 5),
                    const CustomTextFormFeild(
                      upperText: "Description",
                      hint: "Type address description ...",
                      radius: 5,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomButton(
                        child: Text("Confirm",
                            style: TextStyles.font16White700Weight))
                  ],
                );
              },
            ),
          ),
        ));
  }
}

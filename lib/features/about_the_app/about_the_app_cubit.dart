import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/about_us_model.dart';

import 'about_the_app_state.dart';

class AboutTheAppCubit extends Cubit<AboutTheAppState> {
  AboutTheAppCubit() : super(AboutTheAppInit()) {
    fetchAboutUs();
  }

  AboutUsModel? aboutUsModel;
  Section1? section1;
  List<Section2>? section2;
  List<Section3>? section3;
  List<Section4>? section4;
  Section5? section5;

  List<Widget> sections (){
    List<Widget> result = [];

    result.add(Text(Bidi.stripHtmlIfNeeded(section1?.description ?? '')));

    for (int index = 0; index < 4; index++) {
      if (section2 != null && index < section2!.length) {
        result.add(Text(Bidi.stripHtmlIfNeeded(section2![index].description ?? '')));
      }
      if (section3 != null && index < section3!.length) {
        result.add(Text(Bidi.stripHtmlIfNeeded(section3![index].description ?? '')));
      }
    }

    result.add(Text(Bidi.stripHtmlIfNeeded(section5?.description ?? '')));

    return result;
  }

  fetchAboutUs() async {
    emit(AboutUsLoadingState());
    final response = await DioHelper.get("about-us");
    final data = response!.data as Map<String, dynamic>;
    print(response.statusCode);

    if (response.statusCode == 200) {
      aboutUsModel = AboutUsModel.fromJson(data);
      section1 = aboutUsModel?.section1;
      section2 = aboutUsModel?.section2;
      section3 = aboutUsModel?.section3;
      section4 = aboutUsModel?.section4;
      section5 = aboutUsModel?.section5;
      emit(AboutUsSuccessState());
    } else {
      emit(AboutUsErrorState());
    }
  }
}

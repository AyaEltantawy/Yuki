import 'package:bloc/bloc.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/about_us_model.dart';

import 'about_the_app_state.dart';

class AboutTheAppCubit extends Cubit<AboutTheAppState> {
  AboutTheAppCubit() : super(AboutTheAppInit()) {
    fetchAboutUs();
  }

  AboutUsModel? aboutUsModel;
  Section1? section1;

  fetchAboutUs() async {
    emit(AboutUsLoadingState());
    final response = await DioHelper.get("about-us");
    final data = response!.data as Map<String, dynamic>;
print(response.statusCode);
    print(' hhhjbj ${data['status']}');
    if (response.statusCode ==200) {
      aboutUsModel = AboutUsModel.fromJson(data);
      section1 = aboutUsModel?.section1;
     // section2= aboutUsModel?.section2
      emit(AboutUsSuccessState());
    } else {
      emit(AboutUsErrorState());
    }
  }
}

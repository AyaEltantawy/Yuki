import 'package:bloc/bloc.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/contact_us_response.dart';

import 'contactus_state.dart';

class ContactusCubit extends Cubit<ContactusState> {
  ContactusCubit() : super(ContactusStateInit()) {
    fetchContactUs();
  }

  ContactUsResponse? contactUsResponse;

  fetchContactUs() async {
    emit(ContactUsLoadingState());
    final response = await DioHelper.get("contact-us");
    final data = response!.data as Map<String, dynamic>;
    if (data['status'] == true) {
      contactUsResponse = ContactUsResponse.fromJson(data);
      emit(ContactUsSuccessState());
    } else {
      emit(ContactUsErrorState());
    }
  }
}

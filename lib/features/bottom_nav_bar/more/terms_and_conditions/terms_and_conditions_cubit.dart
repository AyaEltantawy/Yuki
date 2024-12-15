import 'package:bloc/bloc.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/policy_model.dart';

import 'terms_and_conditions_state.dart';

class TermsAndConditionsCubit extends Cubit<TermsAndConditionsState> {
  TermsAndConditionsCubit() : super(TermsAndConditionsInit()) {
    fetchPolicy();
  }

  PolicyModel? policyModel;
  String? refundPolicy;
  String? privacyPolicy;
  String? shippingPolicy;
  String? termsOfService;

  fetchPolicy() async {
    print(refundPolicy);
    emit (PolicyLoadingState());
    final response = await DioHelper.get("policy");
    final data = response!.data as Map<String, dynamic>;

    print("xfcfhghjkj $data");

    if (data['status'] == true) {
      policyModel = PolicyModel.fromJson(data);
      refundPolicy = policyModel?.data?.refundPolicy ?? '';
      privacyPolicy = policyModel?.data?.privacyPolicy ?? "";
      shippingPolicy = policyModel?.data?.shippingPolicy ?? "";
      termsOfService = policyModel?.data?.termsOfService ?? "";
      emit(PolicySuccessState());
    }
    else{
      emit(PolicyErrorState());


    }
  }
}

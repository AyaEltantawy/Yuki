import 'package:bloc/bloc.dart';

import 'terms_and_conditions_state.dart';

class TermsAndConditionsCubit extends Cubit<TermsAndConditionsState> {
  TermsAndConditionsCubit() : super(TermsAndConditionsState().init());
}

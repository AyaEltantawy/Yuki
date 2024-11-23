import 'package:bloc/bloc.dart';

import 'confirmpassword_state.dart';

class ConfirmpasswordCubit extends Cubit<ConfirmpasswordState> {
  ConfirmpasswordCubit() : super(ConfirmpasswordState().init());
}

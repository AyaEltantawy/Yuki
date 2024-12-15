import 'package:bloc/bloc.dart';

import 'returnorder_state.dart';

class ReturnorderCubit extends Cubit<ReturnorderState> {
  ReturnorderCubit() : super(ReturnorderState().init());
}

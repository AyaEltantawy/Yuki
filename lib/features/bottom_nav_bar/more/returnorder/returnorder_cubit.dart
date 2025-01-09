import 'package:bloc/bloc.dart';

import 'returnorder_state.dart';

class ReturnorderCubit extends Cubit<ReturnorderState> {
  ReturnorderCubit() : super(ReturnorderState().init());

  int count =1;
  void  increament() {
    count++;
  }

  void decreament() {
    if (count > 1) {
      count--;
    }
  }
}

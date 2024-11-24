import 'package:bloc/bloc.dart';

import 'more_state.dart';

class MoreCubit extends Cubit<MoreState> {
  MoreCubit() : super(MoreState().init());
}

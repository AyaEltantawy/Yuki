import 'package:bloc/bloc.dart';

import 'return_orders_state.dart';

class ReturnOrdersCubit extends Cubit<ReturnOrdersState> {
  ReturnOrdersCubit() : super(ReturnOrdersState().init());
}

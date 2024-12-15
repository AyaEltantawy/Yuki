import 'package:bloc/bloc.dart';

import 'return_order_details_state.dart';

class ReturnOrderDetailsCubit extends Cubit<ReturnOrderDetailsState> {
  ReturnOrderDetailsCubit() : super(ReturnOrderDetailsState().init());
}

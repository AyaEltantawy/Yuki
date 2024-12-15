import 'package:bloc/bloc.dart';

import 'order_tracking_state.dart';

class OrderTrackingCubit extends Cubit<OrderTrackingState> {
  OrderTrackingCubit() : super(OrderTrackingState().init());
}

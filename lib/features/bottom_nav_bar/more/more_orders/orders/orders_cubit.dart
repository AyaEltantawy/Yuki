import 'package:bloc/bloc.dart';

import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersStateInit());
  bool isSelected = false;
  selectContainer(index) {
   activeIndex =index;
    emit(SelectContainer());
  }
  int activeIndex =0;
}

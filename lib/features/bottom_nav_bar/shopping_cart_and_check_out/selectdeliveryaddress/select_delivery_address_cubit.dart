import 'package:bloc/bloc.dart';

import 'select_delivery_address_state.dart';

class SelectdeliveryaddressCubit extends Cubit<SelectdeliveryaddressState> {
  SelectdeliveryaddressCubit() : super(SelectdeliveryaddressState().init());
}

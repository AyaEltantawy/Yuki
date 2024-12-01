import 'package:bloc/bloc.dart';

import 'delivery_addresses_state.dart';

class DeliveryAddressesCubit extends Cubit<DeliveryAddressesState> {
  DeliveryAddressesCubit() : super(DeliveryAddressesStateInit());
}

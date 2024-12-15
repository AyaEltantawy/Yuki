import 'package:bloc/bloc.dart';

import 'add_new_address_state.dart';

class AddNewAddressCubit extends Cubit<AddNewAddressState> {
  AddNewAddressCubit() : super(AddNewAddressStateInit());
  changeMarkerPosition(){
    emit(ChangeMarkerPosition());

  }
}

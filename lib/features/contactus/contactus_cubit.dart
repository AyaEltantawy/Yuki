import 'package:bloc/bloc.dart';

import 'contactus_state.dart';

class ContactusCubit extends Cubit<ContactusState> {
  ContactusCubit() : super(ContactusState().init());
}

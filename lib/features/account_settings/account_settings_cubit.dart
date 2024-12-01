import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'account_settings_state.dart';

class AccountSettingsCubit extends Cubit<AccountSettingsState> {
  AccountSettingsCubit() : super(AccountSettingsStateInit());
  TextEditingController emailController =TextEditingController();
  bool isConnected =false;
  switchConnected(){
isConnected =!isConnected;
emit(SwitchConnected());


  }
}

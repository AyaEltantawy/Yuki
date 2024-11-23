import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterStateInit());
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChecked = false; // Initial state is unchecked

  void toggleCheckbox() {
    isChecked = !isChecked; // Toggle the value
    emit(CheckBoxUpdate());
  }
}

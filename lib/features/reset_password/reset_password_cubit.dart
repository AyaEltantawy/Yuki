import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInit());

  final TextEditingController emailController = TextEditingController();

  bool get isValidEmail {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(emailController.text);
  }
}

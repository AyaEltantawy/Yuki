import 'package:bloc/bloc.dart';

import 'about_the_app_state.dart';

class AboutTheAppCubit extends Cubit<AboutTheAppState> {
  AboutTheAppCubit() : super(AboutTheAppState().init());
}

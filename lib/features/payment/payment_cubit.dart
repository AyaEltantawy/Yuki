import 'package:bloc/bloc.dart';

import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentState().init());
}

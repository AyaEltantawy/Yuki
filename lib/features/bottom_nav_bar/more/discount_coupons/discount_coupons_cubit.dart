import 'package:bloc/bloc.dart';

import 'discount_coupons_state.dart';

class DiscountCouponsCubit extends Cubit<DiscountCouponsState> {
  DiscountCouponsCubit() : super(DiscountCouponsState().init());
}

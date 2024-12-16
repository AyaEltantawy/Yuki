import 'package:bloc/bloc.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/coupons_response.dart';

import 'discount_coupons_state.dart';

class DiscountCouponsCubit extends Cubit<DiscountCouponsState> {
  DiscountCouponsCubit() : super(DisountCouponsStateInit()) {
    fetchCoupons();
  }

  CouponsResponse? couponsResponse;

  fetchCoupons() async {
    emit(FetchCouponsLoadingState());
    final response = await DioHelper.get("coupons");
    final data = response!.data as Map<String, dynamic>;
    print("ddddddddd $data");
    print(response.statusCode);

    if (response.statusCode == 200) {
      couponsResponse = CouponsResponse.fromJson(data);
      emit(FetchCouponsSuccessState());
    } else {
      emit(FetchCouponsErrorState());
    }
  }
}

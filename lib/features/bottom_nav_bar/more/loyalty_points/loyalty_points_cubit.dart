import 'package:bloc/bloc.dart';

import 'loyalty_points_state.dart';

class LoyaltyPointsCubit extends Cubit<LoyaltyPointsState> {
  LoyaltyPointsCubit() : super(LoyaltyPointsState().init());
}

import 'package:bloc/bloc.dart';

import 'favoriteproducts_state.dart';

class FavoriteProductsCubit extends Cubit<FavoriteProductsState> {
  FavoriteProductsCubit() : super(FavoriteProductsState().init());
}

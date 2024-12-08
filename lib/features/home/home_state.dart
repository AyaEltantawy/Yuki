import 'package:yuki/core/models/home_model.dart';

class HomeState {}

class HomeStateInit extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeErrorState extends HomeState {}

class BuildCarouselIndicator extends HomeState {}

class UpdateArrivalsAndFeatured extends HomeState {}

class HomeStateWithBanners extends HomeState {}

class HomeStateError extends HomeState {
  HomeStateError(String message);
}

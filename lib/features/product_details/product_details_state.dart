abstract class ProductDetailsState {}

class ProductDetailsStateInit extends ProductDetailsState {}

class BuildCarouselIndicator extends ProductDetailsState {}

class UpdateArrivalsAndFeatured extends ProductDetailsState {}

class UpdateContainerOnStack extends ProductDetailsState {}

class UpdateArrowRight extends ProductDetailsState {}

class UpdateIncrement extends ProductDetailsState {}

class UpdateDecrement extends ProductDetailsState {}

class UpdateRating extends ProductDetailsState {}

class ProductDetailsLoadingState extends ProductDetailsState {}

class ProductDetailsSuccessState extends ProductDetailsState {}

class ProductDetailsErrorState extends ProductDetailsState {}
class GetProductDetailsState extends ProductDetailsErrorState{}
class UpdateIngredientsAndUseTo extends ProductDetailsState{}
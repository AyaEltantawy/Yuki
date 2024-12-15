abstract class ProductsState {}

class ProductsStateInit extends ProductsState {}

class ClickOnCategoryContainer extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {}

class ProductsErrorState extends ProductsState {}

class SubCategoriesLoadingState extends ProductsState {}

class SubCategoriesSuccessState extends ProductsState {}

class SubCategoriesErrorState extends ProductsState {}
class  OnTapProductState extends ProductsState{}
class UpdateFavorite extends ProductsState{}
class AddFavoriteProductsLoadingState extends ProductsState{}
class AddFavoriteProductsSuccessState extends ProductsState{}
class AddFavoriteProductsErrorState extends ProductsState{}
class AddFavoriteProductsState extends ProductsState {}
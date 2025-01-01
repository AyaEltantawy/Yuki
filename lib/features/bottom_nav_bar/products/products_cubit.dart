import 'package:bloc/bloc.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/products_model.dart';
import 'package:yuki/core/models/sub_categories_model.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/utils/utils.dart';

import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsStateInit()) {
    fetchSubCategories();
  }
  int count=1;
  void increament() {
    count++;
  }

  void decreament() {
    if (count > 1) {
      count--;
    }}
  bool change = true;

  updateActiveIndex(int? id) {
    subCategoryId = id;
    fetchProducts();
    emit(ClickOnCategoryContainer());
  }

  onTapProduct(int? id) {
    productId = id;

    emit(OnTapProductState());
  }

  ProductsModel? productsModel;

  int? categoryId = 0;
  int? subCategoryId = 0;
  int? productId;

  fetchProducts() async {
    emit(ProductsLoadingState());
    final response = await DioHelper.get(
        "products?category_id=${categoryId}&sub_category_id=${subCategoryId}");
    final data = response!.data as Map<String, dynamic>;
    print("xdfcgvhjk $data");
    if (data['status'] == true) {
      print(data['status']);
      productsModel = ProductsModel.fromJson(data);
      print(subCategoryId);
      print(categoryId);
      emit(ProductsSuccessState());
    } else {
      emit(ProductsErrorState());
    }
  }

  int index = 0;
  List<SubCategoryItem> subcategories = [];

  fetchSubCategories() async {
    emit(SubCategoriesLoadingState());
    final response =
        await DioHelper.get("sub-categories?category_id=${categoryId}");
    final data = response!.data as Map<String, dynamic>;

    if (data['status'] == true) {
      final subCategoriesModel = SubCategoriesModel.fromJson(data);
      subcategories = subCategoriesModel.data ?? [];
      fetchProducts();
      // emit(SubCategoriesSuccessState());
    } else {
      emit(SubCategoriesErrorState());
    }
  }

  Set<int> favoriteIndices = {};

  void toggleFavorite(int index) {
    if (!favoriteIndices.contains(index)) {
      favoriteIndices.add(index);
      emit(UpdateFavorite());
    }
  }

  updateFavorite(int index) {
    this.index != index;
    emit(UpdateFavorite());
  }

  void addFavoriteProductsById(int? productId) {
    this.productId = productId;
    addFavoriteProducts(productId);
    emit(AddFavoriteProductsState());
  }

  addFavoriteProducts(productId) async {
    emit(AddFavoriteProductsLoadingState());

    await DioHelper.post(
      "favourite/$productId",
      false,
    ).then((response) async {
      final data = response.data as Map<String, dynamic>;
      print("dataaa $data");
      print(' jdshjhfdsjbdsj${data['message']}');

      if (data['status'] == true) {
        // if (favoriteID.contains(productId) == true) {
        //   favoriteID.remove(productId);
        // } else {
        //   favoriteID.add(productId);
        // }
        // await fetchFavoriteProducts();
        Utils.showSnackBar(
          MagicRouter.currentContext,
          data['message'],
        );
        print("bhnkm${productId}");
        emit(AddFavoriteProductsSuccessState());
      } else {
        Utils.showSnackBar(
          MagicRouter.currentContext,
          data['message'],
        );
        emit(AddFavoriteProductsErrorState());
      }
    });
  }
}

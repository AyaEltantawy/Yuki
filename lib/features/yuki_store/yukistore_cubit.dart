import 'package:bloc/bloc.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/products_model.dart';
import 'package:yuki/core/models/sub_categories_model.dart';

import 'yukistore_state.dart';

class YukistoreCubit extends Cubit<YukistoreState> {
  YukistoreCubit() : super(YukistoreStateInit()) {
    fetchProducts();

    fetchSubCategories();
  }

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

  int categoryId = 0;
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

  List<SubCategoryItem> subcategories = [];

  fetchSubCategories() async {
    emit(SubCategoriesLoadingState());
    final response =
        await DioHelper.get("sub-categories?category_id=${categoryId}");
    final data = response!.data as Map<String, dynamic>;

    if (data['status'] == true) {
      final subCategoriesModel = SubCategoriesModel.fromJson(data);
      subcategories = subCategoriesModel.data ?? [];
      emit(SubCategoriesSuccessState());
    } else {
      emit(SubCategoriesErrorState());
    }
  }
}

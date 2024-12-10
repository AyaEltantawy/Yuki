import 'package:bloc/bloc.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/category_model.dart';

import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesStateInit()) {
    fetchCategories();
  }

  CategoriesModel? categoriesModel;

  fetchCategories() async {
    emit(CategoriesLoadingState());
    final response = await DioHelper.get("categories");
    final data = response!.data as Map<String, dynamic>;
    if (data['status'] == true) {
      categoriesModel = CategoriesModel.fromJson(data);
      emit(CategoriesSuccessState());
    } else {
      emit(CategoriesErrorState());
    }
  }
}

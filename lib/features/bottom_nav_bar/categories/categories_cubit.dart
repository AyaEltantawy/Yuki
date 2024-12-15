import 'package:bloc/bloc.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/category_model.dart';

import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesStateInit()) {
    fetchCategories();
  }

  int index = 0;
  CategoriesModel? categoriesModel;

  categoryOntap(int index) {
    this.index = index;
  }

  int id = 0;

  fetchCategories() async {
    emit(CategoriesLoadingState());
    final response = await DioHelper.get("categories");
    final data = response!.data as Map<String, dynamic>;
    if (data['status'] == true) {
      categoriesModel = CategoriesModel.fromJson(data);
      for (int i = 0; i < (categoriesModel?.data?.length ?? 3); i++)
        id = categoriesModel?.data?[i].id ?? 3;
      emit(CategoriesSuccessState());
    } else {
      emit(CategoriesErrorState());
    }
  }
}

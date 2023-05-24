import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';


import '../../data/model/home_model.dart';
import '../../data/repository/home_repo/home_repo.dart';
import 'home_states.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(InitialStateHome());

  void getCategories() async {
    try {
      emit(GetCategoriesLoadingState());

      List<CategoryModel> categories = await CategoriesRepository().getCategories();

      emit(GetCategoriesSuccessState (categories));
    } catch (e) {
      emit(FailedToGetCategoriesState(e.toString()));
    }
  }
}

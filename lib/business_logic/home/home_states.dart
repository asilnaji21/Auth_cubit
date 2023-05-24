

import '../../data/model/home_model.dart';

abstract class CategoriesState{}
class InitialStateHome extends CategoriesState{}
class GetCategoriesLoadingState extends CategoriesState{}
class GetCategoriesSuccessState extends CategoriesState{
    final List<CategoryModel> categories;

  GetCategoriesSuccessState(this.categories);
}
class FailedToGetCategoriesState extends CategoriesState{
  final String errorMessage;

  FailedToGetCategoriesState(this.errorMessage);
}
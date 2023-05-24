
import '../../model/home_model.dart';
import '../../network/remote/api_result_handler.dart';
import '../../network/remote/dio_helper.dart';

class CategoriesRepository {
  Future<List<CategoryModel>> getCategories() async {
    ApiResults apiResult = await DioHelper().getData(endPoint: "/categories");
    if (apiResult is ApiSuccess) {
      final responseBody = apiResult.data;
      if (responseBody["status"] == true) {
        List<CategoryModel> categories = [];
        for (var item in responseBody["data"]) {
          categories.add(CategoryModel.fromJson(data:item));
        }
        return categories;
      } else {
        throw Exception("Failed to get categories");
      }
    } else {
      throw Exception(ApiFailure);
    }
  }
}

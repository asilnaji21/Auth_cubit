
import '../../network/remote/dio_helper.dart';
import '../../../app/constants_manager.dart';
import '../../network/remote/api_result_handler.dart';

class LoginRepository {
  Future<ApiResults> createLoginData(
    String email,
    String password,
  ) async {
    return await DioHelper().postData(endPoint: EndPoints.signInUrl, data: {
      'email': email,
      'password': password,
    });
  }
}

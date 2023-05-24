
import '../../../app/constants_manager.dart';
import '../../network/remote/api_result_handler.dart';
import '../../network/remote/dio_helper.dart';

class RegisterRepository {
  Future<ApiResults> createRegisterData(
      String fullName,
     String email,
      String password,
     String gender
  ) async {
    
    return await DioHelper().postData(endPoint: EndPoints.registerUrl, data: {
     'full_name': fullName,
          'email': email,
          'password': password,
          'gender': gender,
    });
  }
}

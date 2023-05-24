import 'package:flutter/material.dart';
import 'package:flutter_11_4_2023_cubit/business_logic/Auth/auth_states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/constants_manager.dart';
import '../../data/network/local/local_network.dart';
import '../../data/network/remote/api_result_handler.dart';

import '../../data/repository/register_repository/register_repository.dart';
import '../../data/repository/signin_repository/signin_repository.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  bool isPasswordVisible = true;
  //----------------------- userRegister -----------------------//
  void validateAndRegister({
    required String fullName,
    required String email,
    required String password,
    required String gender,
  }) async {
    {
      emit(RegisterLoadingState());
      final apiResults = await RegisterRepository()
          .createRegisterData(fullName, email, password, gender);
      printTest(fullName);
      printTest(apiResults.toString());

      if (apiResults is ApiSuccess) {
        printTest(apiResults.toString());
        emit(RegisterSuccessState());
      } else if (apiResults is ApiFailure) {
        emit(RegisterFailureState(errorMessage: apiResults.message.toString()));
      }
    }
  }

  //-----------------------  Login -----------------------//

  void validateAndUserLogin(
      {required String email, required String password}) async {
    {
      emit(LoginLoadingState());
      ApiResults apiResults =
          await LoginRepository().createLoginData(email, password);

      if (apiResults is ApiSuccess) {
        await CacheNetwork.insertToCache(
            key: 'token', value: apiResults.data["object"]["token"]);
        emit(LoginSuccessState(message: apiResults.data['message']));
        printTest(apiResults.toString());
      } else if (apiResults is ApiFailure) {
        emit(LoginFailureState(errorMessage: apiResults.message.toString()));
      }
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityChangedState());
  }

}

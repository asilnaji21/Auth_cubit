abstract class AuthStates {}

class AuthInitialState extends AuthStates {}
//----------------------- userLoginState -----------------------//
class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final String message;

  LoginSuccessState({required this.message});
}

class LoginFailureState extends AuthStates {
  final String errorMessage;

  LoginFailureState({required this.errorMessage});
}
//----------------------- userRegisterState -----------------------//
class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {}

class RegisterFailureState extends AuthStates {
  final String errorMessage;

  RegisterFailureState({required this.errorMessage});
}
class PasswordVisibilityChangedState extends AuthStates {}

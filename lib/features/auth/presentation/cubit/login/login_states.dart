import 'package:stylish_app/features/auth/data/models/login_model.dart';


abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {
  final LoginModel loginModel;

  LoginSuccess({required this.loginModel});
}

class LoginFailure extends LoginStates {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

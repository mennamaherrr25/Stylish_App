import 'package:stylish_app/features/auth/data/models/user_model.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {
  final UserModel user;

  LoginSuccess({required this.user});
}

class LoginFailure extends LoginStates {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

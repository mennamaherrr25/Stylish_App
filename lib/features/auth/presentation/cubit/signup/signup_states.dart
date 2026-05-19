import 'package:stylish_app/features/auth/data/models/user_model.dart';

abstract class SignupStates {}

class SignupInitial extends SignupStates {}

class SignupLoading extends SignupStates {}

class SignupSuccess extends SignupStates {
  final UserModel user;

  SignupSuccess( {required this.user});
}

class SignupFailure extends SignupStates {
  final String error;

  SignupFailure(this.error);
}

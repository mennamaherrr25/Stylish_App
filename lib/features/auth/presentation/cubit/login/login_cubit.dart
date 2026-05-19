import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:stylish_app/core/errors/failure.dart';
import 'package:stylish_app/features/auth/data/models/login_model.dart';
import 'package:stylish_app/features/auth/data/repo/auth_repo.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final AuthRepo authRepo;

  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
    // required String name,
    // required String role,
    // required String avatar,
  }) async {
    emit(LoginLoading());

    final Either<ErrorModel, LoginModel> result = await authRepo.login(
      email: email,
      password: password,
    );

    result.fold(
      // Failure
      (failure) {
        emit(LoginFailure(errorMessage: failure.error));
      },

      // Success
      (loginModel) {
        emit(LoginSuccess(loginModel: loginModel));
      },
    );
  }
}

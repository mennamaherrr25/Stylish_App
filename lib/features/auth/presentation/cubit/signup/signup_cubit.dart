import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:stylish_app/core/errors/failure.dart';
import 'package:stylish_app/features/auth/data/repo/auth_repo.dart';
import 'package:stylish_app/features/auth/data/models/user_model.dart';
import 'package:stylish_app/features/auth/presentation/cubit/signup/signup_states.dart';

class SignupCubit extends Cubit<SignupStates> {
  final AuthRepo authRepo;

  SignupCubit(this.authRepo) : super(SignupInitial());

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String role,
    required String avatar,
  }) async {
    emit(SignupLoading());

    final Either<ErrorModel, UserModel> result = await authRepo.signup(
      name: name,
      email: email,
      password: password,
      role: role,
      avatar: avatar,
    );

    result.fold(
      (failure) {
        emit(SignupFailure(failure.error));
      },
      (user) {
        emit(SignupSuccess(user: user));
      },
    );
  }
}

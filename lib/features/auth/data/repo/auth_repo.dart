import 'package:dartz/dartz.dart';
import 'package:stylish_app/core/errors/failure.dart';
import 'package:stylish_app/features/auth/data/models/login_model.dart';
import 'package:stylish_app/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<ErrorModel, LoginModel>> login({
    required String email,
    required String password,
  });

  Future<Either<ErrorModel, UserModel>> signup({
    required String name,
    required String email,
    required String password,
    required String role,
    required String avatar,
  });
}

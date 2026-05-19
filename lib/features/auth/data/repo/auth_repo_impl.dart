import 'package:dartz/dartz.dart';
import 'package:stylish_app/core/api/api_consumer.dart';
import 'package:stylish_app/core/api/end_points.dart';
import 'package:stylish_app/core/errors/exceptions.dart';
import 'package:stylish_app/core/errors/failure.dart';
import 'package:stylish_app/features/auth/data/models/user_model.dart';
import 'package:stylish_app/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiConsumer api;
  AuthRepoImpl({required this.api});

  @override
  Future<Either<ErrorModel, UserModel>> login({
    required String email,
    required String password,
    // required String name,
    // required String role,
    // required String avatar,
  }) async {
    try {
      final response = await api.post(
        path: EndPoints.login,
        data: {
          "email": email,
          "password": password,
          // "name": name,
          // "role": role,
          // "avatar": avatar,
        },
      );
      return right(UserModel.fromJson(response)); 
    } on ServerException catch (e) {
      
      return left(ErrorModel(error: e.errorModel.error)); 
    }
  }

  @override
  Future<Either<ErrorModel, UserModel>> signup({
    required String name,
    required String email,
    required String password,
    required String role,
    required String avatar,
  }) async {
    try {
      final response = await api.post(
        path: EndPoints.signUp,
        data: {
          "name": name,
          "email": email,
          "password": password,
          "role": role,
          "avatar": avatar,
        },
      );
      return right(UserModel.fromJson(response)); 
    } on ServerException catch (e) {
      return left(ErrorModel(error: e.errorModel.error)); 
    }
  }
}

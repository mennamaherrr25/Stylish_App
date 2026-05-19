import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:stylish_app/core/api/api_consumer.dart';
import 'package:stylish_app/core/api/dio_consumer.dart';

import 'package:stylish_app/features/auth/data/repo/auth_repo.dart';
import 'package:stylish_app/features/auth/data/repo/auth_repo_impl.dart';

import 'package:stylish_app/features/auth/presentation/cubit/login/login_cubit.dart';

import 'package:stylish_app/features/auth/presentation/cubit/signup/signup_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {

  // Dio
  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );

  // Api Consumer
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(
      dio: getIt<Dio>(),
    ),
  );

  // Auth Repo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      api: getIt<ApiConsumer>(),
    ),
  );

  // Signup Cubit
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(
      getIt<AuthRepo>(),
    ),
  );

  // Login Cubit
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      getIt<AuthRepo>(),
    ),
  );
}
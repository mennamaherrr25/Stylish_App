import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stylish_app/core/api/api_consumer.dart';
import 'package:stylish_app/core/api/dio_consumer.dart';
import 'package:stylish_app/features/auth/data/repo/auth_repo.dart';
import 'package:stylish_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:stylish_app/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:stylish_app/features/auth/presentation/cubit/signup/signup_cubit.dart';
import 'package:stylish_app/features/home/presentation/cubit/categories/category_cubit.dart';
import 'package:stylish_app/features/home/presentation/cubit/products/products_cubit.dart';
import 'package:stylish_app/features/home/data/repo/categories/category_repo.dart';
import 'package:stylish_app/features/home/data/repo/categories/category_repo_impl.dart';
import 'package:stylish_app/features/home/data/repo/products/products_repo.dart';
import 'package:stylish_app/features/home/data/repo/products/products_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Dio
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Api Consumer
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: getIt<Dio>()),
  );

  // Auth Repo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(api: getIt<ApiConsumer>()),
  );

  // Signup Cubit
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<AuthRepo>()));

  // Login Cubit
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepo>()));

  // Category Repo
  getIt.registerLazySingleton<CategoryRepo>(
    () => CategoryRepoImpl(api: getIt<ApiConsumer>()),
  );

  // Category Cubit
  getIt.registerFactory<CategoryCubit>(
    () => CategoryCubit(categoryRepo: getIt<CategoryRepo>()),
  );
  // Products Repo
  getIt.registerLazySingleton<ProductsRepo>(
    () => ProductsRepoImpl(api: getIt<ApiConsumer>()),
  );

  // Category Cubit
  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(productsRepo: getIt<ProductsRepo>()),
  );
}

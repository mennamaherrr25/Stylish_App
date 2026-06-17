import 'package:dartz/dartz.dart';
import 'package:stylish_app/core/api/api_consumer.dart';
import 'package:stylish_app/core/api/end_points.dart';
import 'package:stylish_app/core/errors/exceptions.dart';
import 'package:stylish_app/core/errors/failure.dart';
import 'package:stylish_app/features/home/data/models/category_model.dart';
import 'package:stylish_app/features/home/data/repo/categories/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final ApiConsumer api;

  CategoryRepoImpl({required this.api});

  @override
  Future<Either<ErrorModel, List<CategoryModel>>> getCategories() async {
    try {
      final response = await api.get(path: EndPoints.categories, data: null);

      final categories = (response as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();

      return right(categories);
    } on ServerException catch (e) {
      return left(
        ErrorModel(error: e.errorModel.error, status: e.errorModel.status),
      );
    }
  }
}

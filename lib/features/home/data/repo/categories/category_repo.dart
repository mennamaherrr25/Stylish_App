import 'package:dartz/dartz.dart';
import 'package:stylish_app/core/errors/failure.dart';
import 'package:stylish_app/features/home/data/models/category_model.dart';

abstract class CategoryRepo {
  Future<Either<ErrorModel, List<CategoryModel>>> getCategories();
}
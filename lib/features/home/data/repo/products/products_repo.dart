import 'package:dartz/dartz.dart';
import 'package:stylish_app/core/errors/failure.dart';
import 'package:stylish_app/features/home/data/models/products_model.dart';

abstract class ProductsRepo {
  Future<Either<ErrorModel, List<ProductsModel>>> getProducts({
    String? categorySlug,
    int? skip,
    int? limit,
    // int? priceMin,
    // int? priceMax,
    // String? title,
  });
}

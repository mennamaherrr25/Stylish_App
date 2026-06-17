import 'package:dartz/dartz.dart';
import 'package:stylish_app/core/api/api_consumer.dart';
import 'package:stylish_app/core/api/end_points.dart';
import 'package:stylish_app/core/errors/exceptions.dart';
import 'package:stylish_app/core/errors/failure.dart';
import 'package:stylish_app/features/home/data/models/products_model.dart';
import 'package:stylish_app/features/home/data/repo/products/products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ApiConsumer api;

  ProductsRepoImpl({required this.api});

  @override
  Future<Either<ErrorModel, List<ProductsModel>>> getProducts({
    String? categorySlug,
    int? skip,
    int? limit,
  }) async {
    final List<ProductsModel> productsList = [];
    try {
      final response = await api.get(
        path: EndPoints.products,
        data: null,
        queryParameters: {
          if (categorySlug != null) 'categorySlug': categorySlug,
          if (skip != null) 'offset': skip,
          if (limit != null) 'limit': limit,
        },
      );

      for (var element in response) {
        productsList.add(ProductsModel.fromjson(element));
      }
      return right(productsList);
    } on ServerException catch (e) {
      return left(
        ErrorModel(error: e.errorModel.error, status: e.errorModel.status),
      );
    }

    // final products = (response as List)
    //     .map((e) => ProductsModel.fromJson(e))
    //     .toList();
  }
}

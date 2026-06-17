import 'package:stylish_app/features/home/data/models/products_model.dart';

abstract class ProductsStates {}

class ProductsInitial extends ProductsStates {}

class ProductsLoading extends ProductsStates {}

class ProductsSuccess extends ProductsStates {
  final List<ProductsModel> productsList;

  ProductsSuccess({required this.productsList});
}

class ProductsLoadingMore extends ProductsStates {
  final List<ProductsModel> productsList;

  ProductsLoadingMore({required this.productsList});
}

class ProductsFailure extends ProductsStates {
  final String errorMessage;

  ProductsFailure({required this.errorMessage});
}

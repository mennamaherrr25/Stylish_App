import 'package:stylish_app/features/home/data/models/category_model.dart';

abstract class CategoryStates {}

class CategoryInitial extends CategoryStates {}

class CategoryLoading extends CategoryStates {}

class CategorySuccess extends CategoryStates {
  final List<CategoryModel> categories;

  CategorySuccess({
    required this.categories,
  });
}

class CategoryFailure extends CategoryStates {
  final String errorMessage;

  CategoryFailure({
    required this.errorMessage,
  });
}
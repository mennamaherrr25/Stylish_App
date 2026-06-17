import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_app/features/home/presentation/cubit/categories/category_states.dart';
import 'package:stylish_app/features/home/data/repo/categories/category_repo.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  final CategoryRepo categoryRepo;

  CategoryCubit({required this.categoryRepo}) : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());

    final result = await categoryRepo.getCategories();

    result.fold(
      (failure) {
        emit(CategoryFailure(errorMessage: failure.error));
      },
      (categories) {
        emit(CategorySuccess(categories: categories));
      },
    );
  }
}

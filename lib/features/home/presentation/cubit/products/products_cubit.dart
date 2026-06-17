import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_app/features/home/data/models/products_model.dart';
import 'package:stylish_app/features/home/data/repo/products/products_repo.dart';
import 'package:stylish_app/features/home/presentation/cubit/products/products_states.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  final ProductsRepo productsRepo;

  ProductsCubit({required this.productsRepo}) : super(ProductsInitial());

  int limit = 20;
  int skip = 0;
  bool hasMore = true;
  bool isLoadingMore = false;

  List<ProductsModel> products = [];

  Future<void> getProducts({
    String? categorySlug,
    bool isLoadMore = false,
  }) async {
    // ❌ prevent spam requests
    if (isLoadMore && (isLoadingMore || !hasMore)) return;

    if (!isLoadMore) {
      skip = 0;
      products.clear();
      hasMore = true;

      emit(ProductsLoading());
    } else {
      isLoadingMore = true;
      emit(ProductsLoadingMore(productsList: products));
    }

    final result = await productsRepo.getProducts(
      categorySlug: categorySlug,
      skip: skip,
      limit: limit,
    );

    result.fold(
      (failure) {
        isLoadingMore = false;

        // لو load more فشل → حافظ على الليست
        if (products.isNotEmpty) {
          emit(ProductsSuccess(productsList: products));
        } else {
          emit(ProductsFailure(errorMessage: failure.error));
        }
      },

      (newProducts) {
        isLoadingMore = false;

        if (newProducts.length < limit) {
          hasMore = false;
        }

        products.addAll(newProducts);
        skip += limit;

        emit(ProductsSuccess(productsList: products));
      },
    );
  }
}
// class ProductsCubit extends Cubit<ProductsStates> {
//   final ProductsRepo productsRepo;

//   ProductsCubit({required this.productsRepo}) : super(ProductsInitial());

//   int limit = 20;
//   int skip = 0;
//   bool hasMore = true;

//   List<ProductsModel> products = [];

//   Future<void> getProducts({
//     String? categorySlug,
//     bool isLoadMore = false,
//   }) async {
//     if (!hasMore && isLoadMore) return;

//     if (!isLoadMore) {
//       skip = 0;
//       products.clear();
//       hasMore = true;

//       emit(ProductsLoading());
//     } else {
//       emit(ProductsLoadingMore(productsList: products));
//     }

//     final result = await productsRepo.getProducts(
//       categorySlug: categorySlug,
//       skip: skip,
//       limit: limit,
//     );

//     result.fold(
//       (failure) {
//         emit(ProductsFailure(errorMessage: failure.error));
//       },

//       (newProducts) {
//         if (newProducts.length < limit) {
//           hasMore = false;
//         }

//         products.addAll(newProducts);

//         skip += limit;

//         emit(ProductsSuccess(productsList: products));
//       },
//     );
//   }
//}
////////////////
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:stylish_app/features/home/presentation/cubit/products/products_states.dart';
// import 'package:stylish_app/features/home/data/repo/products/products_repo.dart';

// class ProductsCubit extends Cubit<ProductsStates> {
//   final ProductsRepo productsRepo;

//   ProductsCubit({required this.productsRepo}) : super(ProductsInitial());

//   int limit = 20;
//   int skip = 0;
//   bool hasMore = true;

//   Future<void> getProducts({
//     String? categorySlug,
//     bool isLoadMore = false,
//   }) async {
//     if (!hasMore && isLoadMore) return;
//     if (!isLoadMore) {
//       skip = 0;
//       hasMore = true;
//     }

//     emit(ProductsLoading());

//     final result = await productsRepo.getProducts(categorySlug: categorySlug);

//     result.fold(
//       (failure) {
//         emit(ProductsFailure(errorMessage: failure.error));
//       },
//       (products) {
//         emit(ProductsSuccess(productsList: products));
//       },
//     );
//   }

//   //getProducts() {}
// }

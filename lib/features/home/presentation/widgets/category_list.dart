import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stylish_app/core/routing/app_routes.dart';
import 'package:stylish_app/features/home/presentation/cubit/categories/category_cubit.dart';
import 'package:stylish_app/features/home/presentation/cubit/categories/category_states.dart';
import 'package:stylish_app/features/home/presentation/widgets/category_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: SizedBox(
          width: double.infinity,
          height: 90.h,
          child: CategoryListBody(),
        ),
      ),
    );
  }
}

class CategoryListBody extends StatelessWidget {
  const CategoryListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(
      builder: (context, state) {
        if (state is CategoryFailure) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is CategoryLoading) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Column(
                    children: [
                      Container(
                        width: 56.w,
                        height: 56.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(width: 50.w, height: 10.h, color: Colors.white),
                    ],
                  ),
                ),
              );
            },
          );
        }

        if (state is CategorySuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              final category = state.categories[index];
              return CategoryCard(
                category: category,
                onTap: () {
                  context.push(AppRoutes.productsView, extra: category.slug);
                },
              );
            },
          );
        }

        return SizedBox();
      },
    );
  }
}

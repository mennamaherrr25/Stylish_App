import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/core/widgets/product_shimmer_card.dart';
import 'package:stylish_app/features/home/presentation/cubit/products/products_cubit.dart';
import 'package:stylish_app/features/home/presentation/cubit/products/products_states.dart';
import 'package:stylish_app/features/home/presentation/widgets/product_card.dart';

class ProductsListSection extends StatelessWidget {
  const ProductsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        width: double.infinity,
        height: 320.h,
        child: BlocBuilder<ProductsCubit, ProductsStates>(
          builder: (context, state) {

            if (state is ProductsFailure) {
              return Center(child: Text(state.errorMessage));
            }

            if (state is ProductsLoading) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return  ProductShimmerCard();
                },
              );
            }
            
            if (state is ProductsSuccess) {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ProductCard(
                    oldPrice: '\$2499',
                    discount: '40% Off',
                    rating: 4.2,
                    reviewsCount: '56890',
                    productModel: state.productsList[index],
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

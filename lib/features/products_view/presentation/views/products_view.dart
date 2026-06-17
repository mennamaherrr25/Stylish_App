import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_app/core/widgets/home_app_bar.dart';
import 'package:stylish_app/core/widgets/product_shimmer_card.dart';
import 'package:stylish_app/core/widgets/products_control_bar.dart';
import 'package:stylish_app/core/widgets/products_control_bar_shimmer.dart';
import 'package:stylish_app/features/home/presentation/cubit/products/products_cubit.dart';
import 'package:stylish_app/features/home/presentation/cubit/products/products_states.dart';
import 'package:stylish_app/features/home/presentation/widgets/product_card.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: BlocBuilder<ProductsCubit, ProductsStates>(
        builder: (context, state) {
          if (state is ProductsFailure) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is ProductsLoading) {
            return Column(
              children: [
                const ProductControlBarShimmer(),
                Expanded(
                  child: GridView.builder(
                    itemCount: 6,
                    padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.6,
                          mainAxisSpacing: 12,
                        ),
                    itemBuilder: (context, index) {
                      return ProductShimmerCard();
                    },
                  ),
                ),
              ],
            );
          }

          if (state is ProductsSuccess || state is ProductsLoadingMore) {
            final products = (state is ProductsSuccess)
                ? state.productsList
                : (state as ProductsLoadingMore).productsList;

            return Column(
              children: [
                ProductControlBar(text: '${products.length} Items'),

                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (scrollInfo) {
                      if (scrollInfo.metrics.pixels >=
                          scrollInfo.metrics.maxScrollExtent - 200) {
                        context.read<ProductsCubit>().getProducts(
                          isLoadMore: true,
                        );
                      }
                      return false;
                    },

                    child: Stack(
                      children: [
                        GridView.builder(
                          padding: const EdgeInsets.only(
                            left: 12,
                            top: 8,
                            bottom: 8,
                          ),
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1 / 1.6,
                                mainAxisSpacing: 12,
                              ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              oldPrice: '\$2499',
                              discount: '40% Off',
                              rating: 4.2,
                              reviewsCount: '56890',
                              productModel: products[index],
                            );
                          },
                        ),

                        // 🔥 LOADING MORE OVERLAY IN CENTER
                        if (state is ProductsLoadingMore)
                          const Positioned.fill(
                            child: Center(child: CircularProgressIndicator()),
                          ),
                      ],
                    ),
                  ),
                ),

                // Expanded(
                //   child: NotificationListener<ScrollNotification>(
                //     onNotification: (scrollInfo) {
                //       if (scrollInfo.metrics.pixels >=
                //           scrollInfo.metrics.maxScrollExtent - 200) {
                //         context.read<ProductsCubit>().getProducts(
                //           isLoadMore: true,
                //         );
                //       }
                //       return false;
                //     },

                //     child: GridView.builder(
                //               padding: const EdgeInsets.only(
                //                 left: 12,
                //                 top: 8,
                //                 bottom: 8,
                //               ),
                //               physics: const BouncingScrollPhysics(),
                //               gridDelegate:
                //                   const SliverGridDelegateWithFixedCrossAxisCount(
                //                     crossAxisCount: 2,
                //                     childAspectRatio: 1 / 1.6,
                //                     mainAxisSpacing: 12,
                //                   ),

                //               itemCount:
                //                   products.length +
                //                   (state is ProductsLoadingMore ? 1 : 0),

                //               itemBuilder: (context, index) {
                //                 if (index == products.length &&
                //                     state is ProductsLoadingMore) {
                //                   return const SizedBox(
                //                     height: 100,
                //                     child: Center(child: CircularProgressIndicator()),
                //                   );
                //                 }

                //                 return ProductCard(
                //                   oldPrice: '\$2499',
                //                   discount: '40% Off',
                //                   rating: 4.2,
                //                   reviewsCount: '56890',
                //                   productModel: products[index],
                //                 );
                //               },
                //             ),
                //           ),
                //         ),
                //       ],
                //     );
                //   }

                //           return const SizedBox();
                //         },
                // //////////////////////////////
                // builder: (context, state) {

                //   if (state is ProductsFailure) {
                //     return Center(child: Text(state.errorMessage));
                //   }
                //   return state is ProductsSuccess || state is ProductsLoadingMore
                //       ? Column(
                //           children: [
                //             ProductControlBar(
                //               text: ' ${state.productsList.length.toString()} Items',
                //             ),
                //             Expanded(
                //               child: NotificationListener<ScrollNotification>(
                //                 onNotification: (ScrollNotification scrollInfo) {
                //                   if (scrollInfo.metrics.pixels ==
                //                       scrollInfo.metrics.maxScrollExtent) {
                //                     context.read<ProductsCubit>().getProducts(
                //                       isLoadMore: true,
                //                     );
                //                   }
                //                   return true;
                //                 },

                //                 child: GridView.builder(
                //                   padding: EdgeInsets.only(left: 12, top: 8, bottom: 8),
                //                   physics: BouncingScrollPhysics(),
                //                   gridDelegate:
                //                       SliverGridDelegateWithFixedCrossAxisCount(
                //                         crossAxisCount: 2,
                //                         childAspectRatio: 1 / 1.6,
                //                         mainAxisSpacing: 12,
                //                       ),
                //                   itemCount: state.productsList.length,
                //                   itemBuilder: (BuildContext context, int index) {
                //                     return ProductCard(
                //                       oldPrice: '\$2499',
                //                       discount: '40% Off',
                //                       rating: 4.2,
                //                       reviewsCount: '56890',
                //                       productModel: state.productsList[index],
                //                       //   productModel: ,
                //                     );
                //                   },
                //                 ),
                //               ),
                //             ),
                //           ],
                //         )
                //       : state is ProductsLoading
                //       ? Column(
                //           children: [
                //             ProductControlBarShimmer(),
                //             Expanded(
                //               child: GridView.builder(
                //                 itemCount: 6,
                //                 padding: EdgeInsets.only(left: 12, top: 8, bottom: 8),
                //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //                   crossAxisCount: 2,
                //                   childAspectRatio: 1 / 1.6,
                //                   mainAxisSpacing: 12,
                //                 ),
                //                 itemBuilder: (BuildContext context, int index) {
                //                   return ProductShimmerCard();
                //                 },
                //               ),
                //             ),
                //           ],
                //         )
                //       : SizedBox();
                // },
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/features/home/data/models/products_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productModel,
    required this.oldPrice,
    required this.discount,
    required this.rating,
    required this.reviewsCount,
  });

  final String oldPrice;
  final String discount;
  final double rating;
  final String reviewsCount;
  final ProductsModel productModel;
  @override
  Widget build(BuildContext context) {
    {
      return Container(
        width: 160.w,
        margin: EdgeInsets.only(right: 12.w,),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              child: Image.network(
                productModel.image,
                height: 140.h,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Container(
                      width: double.infinity,
                      height: 140.h,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.image, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TITLE
                  Text(
                    productModel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  // DESCRIPTION
                  Text(
                    productModel.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                  ),

                  SizedBox(height: 8.h),

                  // PRICE
                  Text(
                    '\$${productModel.price}',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // OLD PRICE + DISCOUNT
                  Row(
                    children: [
                      Text(
                        oldPrice,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        discount,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: const Color(0xFFFF949A),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 6.h),

                  // RATING
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < rating.floor()
                                ? Icons.star
                                : Icons.star_border,
                            size: 14.sp,
                            color: Colors.amber,
                          );
                        }),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          reviewsCount,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmerCard extends StatelessWidget {
  const ProductShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 150.h,
                width: double.infinity,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 8.h),

            // Title
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 16.h,
                width: 120.w,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 8.h),

            // Description
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 12.h,
                width: 150.w,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 10.h),

            // Price
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 16.h,
                width: 60.w,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 10.h),

            // Rating
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 14.h,
                width: 100.w,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 8.r),
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedMic02,
            // size: 30,
          ),
        ),
        suffixIconConstraints: BoxConstraints(maxWidth: 30.w, maxHeight: 30.h),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 8.r),
          child: HugeIcon(icon: HugeIcons.strokeRoundedSearch01),
        ),
        prefixIconConstraints: BoxConstraints(maxWidth: 30.w, maxHeight: 30.h),
        hintText: 'Search any Product..',
        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

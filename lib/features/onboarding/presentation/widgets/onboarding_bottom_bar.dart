import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_app/core/routing/app_routes.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/widgets/custom_text_button.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';
import 'package:stylish_app/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:stylish_app/features/onboarding/presentation/cubit/onboarding_states.dart';
import 'package:stylish_app/features/onboarding/presentation/widgets/onboarding_dot_indicator.dart';

class OnboardingBottomBar extends StatelessWidget {
  const OnboardingBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();

    return BlocBuilder<OnboardingCubit, OnboardingStates>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //  Prev
              cubit.isFirstPage
                  ? SizedBox(width: 60.w)
                  : CustomTextButton(
                      onPressed: () => cubit.previusPage(),
                      widget: CustomTextWidget(
                        text: 'Prev',
                        style: AppTextStyles.semiBold18.copyWith(
                          color: AppColors.greyText,
                        ),
                      ),
                    ),
              //  Dot Indicator
              OnboardingDotIndicator(
                currentPage: cubit.currentPage,
                pagesCount: cubit.pages.length,
              ),

              // Next & Get Started
              CustomTextButton(
                onPressed: () {
                  if (cubit.isLastPage) {
                    context.go(AppRoutes.login);
                  } else {
                    cubit.nextPage();
                  }
                },
                widget: CustomTextWidget(
                  text: cubit.isLastPage ? 'Get Started' : 'Next',
                  style: AppTextStyles.semiBold18.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

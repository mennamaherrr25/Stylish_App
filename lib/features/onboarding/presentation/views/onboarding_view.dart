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
import 'package:stylish_app/features/onboarding/presentation/widgets/onboarding_bottom_bar.dart';
import 'package:stylish_app/features/onboarding/presentation/widgets/onboarding_counter.dart';
import 'package:stylish_app/features/onboarding/presentation/widgets/onboarding_page.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),

      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<OnboardingCubit, OnboardingStates>(
            builder: (context, state) {
              final cubit = context.read<OnboardingCubit>();
              return OnboardingViewBody(cubit: cubit);
            },
          ),
        ),
      ),
    );
  }
}

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({
    super.key,
    required this.cubit,
  });

  final OnboardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  Skip + Counter
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 12.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OnboardingCounter(
                currentPage: cubit.currentPage,
                pagesCount: cubit.pages.length,
              ),
    
              CustomTextButton(
                onPressed: () => context.go(AppRoutes.login),
                widget: CustomTextWidget(
                  text: 'Skip',
                  style: AppTextStyles.semiBold18.copyWith(
                    color: AppColors.blackText,
                  ),
                ),
              ),
            ],
          ),
        ),
        // PageView
        Expanded(
          child: PageView.builder(
            controller: cubit.pageController,
            onPageChanged: cubit.onPageChanged,
            itemCount: cubit.pages.length,
            itemBuilder: (context, index) {
              return OnboardingPage(model: cubit.pages[index]);
            },
          ),
        ),
        OnboardingBottomBar(),
      ],
    );
  }
}


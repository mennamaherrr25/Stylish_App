import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:stylish_app/features/onboarding/presentation/cubit/onboarding_states.dart';
import 'package:stylish_app/generated/assets.dart';

class OnboardingCubit extends Cubit<OnboardingStates> {
  OnboardingCubit() : super(OnboardingInitial());

  final PageController pageController = PageController();

  int currentPage = 0;

  bool get isLastPage => currentPage == pages.length - 1;

  bool get isFirstPage => currentPage == 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: Assets.assetsImagesOnboarding1,
      title: 'Discover Your Style',
      description:
          'Explore thousands of products from top brands and find what suits you.',
    ),
    OnboardingModel(
      image: Assets.assetsImagesOnboarding2,
      title: 'Easy Payment',
      description:
          'Pay with confidence using our fast and secure payment methods.',
    ),
    OnboardingModel(
      image: Assets.assetsImagesOnboarding3,
      title: 'Get Your Order',
      description:
          'Get your orders delivered to your door quickly and on time.',
    ),
  ];

  void onPageChanged(int index) {
    currentPage = index;

    emit(OnboardingPageChanged(currentPage: index));
  }

  void nextPage() {
    if (currentPage < pages.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previusPage() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}

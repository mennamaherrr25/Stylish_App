import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/core/widgets/home_app_bar.dart';
import 'package:stylish_app/core/widgets/products_control_bar.dart';
import 'package:stylish_app/features/home/presentation/widgets/banner_section.dart';
import 'package:stylish_app/features/home/presentation/widgets/category_list.dart';
import 'package:stylish_app/features/home/presentation/widgets/deal_of_day_card.dart';
import 'package:stylish_app/features/home/presentation/widgets/home_search_field.dart';
import 'package:stylish_app/features/home/presentation/widgets/product_list_section.dart';
import 'package:stylish_app/features/home/presentation/widgets/special_offers_card.dart';
import 'package:stylish_app/features/onboarding/presentation/widgets/onboarding_dot_indicator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: HomeAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: HomeBody(),
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override 
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        HomeSearchField(),
        ProductControlBar(text: 'All Featured',),
        CategoryList(),
        BannerSection(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [OnboardingDotIndicator(currentPage: 3, pagesCount: 3)],
          ),
        ),
        DealOfDayCard(),
        ProductsListSection(),
        SpecialOffersCard(),
      ],
    );
  }
}

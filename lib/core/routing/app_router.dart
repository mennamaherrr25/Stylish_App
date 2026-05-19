import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:stylish_app/core/routing/app_routes.dart';
import 'package:stylish_app/core/services/service_locator.dart';

import 'package:stylish_app/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:stylish_app/features/auth/presentation/cubit/signup/signup_cubit.dart';

import 'package:stylish_app/features/auth/presentation/views/forgot_password_view.dart';
import 'package:stylish_app/features/auth/presentation/views/get_started_view.dart';
import 'package:stylish_app/features/auth/presentation/views/login_view.dart';
import 'package:stylish_app/features/auth/presentation/views/signup_view.dart';

import 'package:stylish_app/features/layout/presentation/views/layout_view.dart';

import 'package:stylish_app/features/onboarding/presentation/views/onboarding_view.dart';

import 'package:stylish_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),

      // LOGIN
      GoRoute(
        path: AppRoutes.login,

        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<LoginCubit>(),

            child: const LoginView(),
          );
        },
      ),

      // SIGNUP
      GoRoute(
        path: AppRoutes.signup,

        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<SignupCubit>(),

            child: const SignUpView(),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordView(),
      ),

      GoRoute(
        path: AppRoutes.getstarted,
        builder: (context, state) => const GetStartedView(),
      ),

      GoRoute(
        path: AppRoutes.layout,
        builder: (context, state) => const LayoutView(),
      ),
    ],
  );
}

// import 'package:go_router/go_router.dart';
// import 'package:stylish_app/core/routing/app_routes.dart';
// import 'package:stylish_app/features/auth/presentation/views/forgot_password_view.dart';
// import 'package:stylish_app/features/auth/presentation/views/get_started_view.dart';
// import 'package:stylish_app/features/auth/presentation/views/login_view.dart';
// import 'package:stylish_app/features/auth/presentation/views/signup_view.dart';
// import 'package:stylish_app/features/layout/presentation/views/layout_view.dart';
// import 'package:stylish_app/features/onboarding/presentation/views/onboarding_view.dart';
// import 'package:stylish_app/features/splash/presentation/views/splash_view.dart';

// abstract class AppRouter {
//   static final router = GoRouter(
//     routes: [
//       GoRoute(
//         path: AppRoutes.splash,
//         builder: (context, state) => SplashView(),
//       ),
//       GoRoute(
//         path: AppRoutes.onboarding,
//         builder: (context, state) => OnboardingView(),
//       ),
//       GoRoute(path: AppRoutes.login, builder: (context, state) => LoginView()),
//       GoRoute(
//         path: AppRoutes.signup,
//         builder: (context, state) => SignUpView(),
//       ),
//       GoRoute(
//         path: AppRoutes.forgotPassword,
//         builder: (context, state) => ForgotPasswordView(),
//       ),
//       GoRoute(
//         path: AppRoutes.getstarted,
//         builder: (context, state) => GetStartedView(),
//       ),
//       GoRoute(
//         path: AppRoutes.layout,
//         builder: (context, state) => LayoutView(),
//       ),

//     ],
//   );
// }

import 'package:go_router/go_router.dart';
import 'package:stylish_app/core/routing/app_routes.dart';
import 'package:stylish_app/features/auth/views/forgot_password_view.dart';
import 'package:stylish_app/features/auth/views/get_started_view.dart';
import 'package:stylish_app/features/auth/views/login_view.dart';
import 'package:stylish_app/features/auth/views/signup_view.dart';
import 'package:stylish_app/features/layout/views/layout_view.dart';
import 'package:stylish_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:stylish_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => OnboardingView(),
      ),
      GoRoute(path: AppRoutes.login, builder: (context, state) => LoginView()),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => SignUpView(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => ForgotPasswordView(),
      ),
      GoRoute(
        path: AppRoutes.getstarted,
        builder: (context, state) => GetStartedView(),
      ),
      GoRoute(
        path: AppRoutes.layout,
        builder: (context, state) => LayoutView(),
      ),

    ],
  );
}

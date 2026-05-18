import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stylish_app/core/routing/app_router.dart';
import 'package:stylish_app/core/theme/app_light_theme.dart';
import 'package:stylish_app/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const StylishApp());
}

class StylishApp extends StatelessWidget {
  const StylishApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        
        locale: const Locale('en'),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Stylish App',
        theme: AppTheme.lightTheme,
      
        routerConfig: AppRouter.router,
      ),
    );
  }
}

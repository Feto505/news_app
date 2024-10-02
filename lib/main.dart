import 'package:flutter/material.dart';
import '/core/config/app_router.dart';
import '/core/config/page_routes_name.dart';
import '/core/theme/app_theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News app",
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.themeData,
      // themeMode: AppThemeManager.lightTheme,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

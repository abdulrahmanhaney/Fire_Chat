import 'package:fire_chat/Core/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:fire_chat/Core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fire Chat',
      themeMode: ThemeMode.light,
      theme: AppThemes.lightTheme(),
      darkTheme: AppThemes.darkTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}

import 'package:fire_chat/Core/utils/app_themes.dart';
import 'package:fire_chat/Featured/Auth/presentataion/views/login_view.dart';
import 'package:fire_chat/Featured/Auth/presentataion/views/register_view.dart';
import 'package:fire_chat/Featured/Auth/presentataion/views/reset_password_view.dart';
import 'package:fire_chat/Featured/Splash/splash_view.dart';
import 'package:fire_chat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [],
      child: MaterialApp(
        title: 'Fire Chat',
        themeMode: ThemeMode.light,
        theme: AppThemes.lightTheme(),
        darkTheme: AppThemes.darkTheme(),
        debugShowCheckedModeBanner: false,
        routes: {
          SplashView.id: (context) => const SplashView(),
        },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case LoginView.id:
              return PageTransition(
                child: const LoginView(),
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 500),
                settings: settings,
              );
            case RegisterView.id:
              return PageTransition(
                child: const RegisterView(),
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 500),
                settings: settings,
              );
            case ResetPasswordView.id:
              return PageTransition(
                child: const ResetPasswordView(),
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 500),
                settings: settings,
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}

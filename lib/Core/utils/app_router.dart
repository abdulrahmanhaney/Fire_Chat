import 'package:fire_chat/Featured/Auth/views/login_view.dart';
import 'package:fire_chat/Featured/Auth/views/register_view.dart';
import 'package:go_router/go_router.dart';
import 'package:fire_chat/Featured/Splash/splash_view.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: SplashView.id,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RegisterView.id,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: LoginView.id,
      builder: (context, state) => const LoginView(),
    ),
  ],
);

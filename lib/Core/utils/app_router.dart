import 'package:go_router/go_router.dart';
import 'package:fire_chat/Featured/Splash/splash_view.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: SplashView.id,
      builder: (context, state) => const SplashView(),
    ),
  ],
);

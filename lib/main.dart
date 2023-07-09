import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_chat/Core/utils/app_themes.dart';
import 'package:fire_chat/Core/utils/service_lactor.dart';
import 'package:fire_chat/Featured/Auth/data/repositories/auth_repo_impl.dart';
import 'package:fire_chat/Featured/Auth/presentataion/manager/create_user_cubit/create_user_cubit.dart';
import 'package:fire_chat/Featured/Auth/presentataion/manager/login_user_cubit/login_user_cubit.dart';
import 'package:fire_chat/Featured/Auth/presentataion/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:fire_chat/Featured/Auth/presentataion/views/login_view.dart';
import 'package:fire_chat/Featured/Auth/presentataion/views/register_view.dart';
import 'package:fire_chat/Featured/Auth/presentataion/views/reset_password_view.dart';
import 'package:fire_chat/Featured/Home/presentation/views/home_view.dart';
import 'package:fire_chat/Featured/Splash/splash_view.dart';
import 'package:fire_chat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupGetIt();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var authrepoimpl = getIt.get<AuthRepoImpl>();
    var shared = getIt.get<SharedPreferences>();
    var users = getIt.get<CollectionReference>(instanceName: 'users');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateUserCubit(authrepoimpl, users),
        ),
        BlocProvider(
          create: (context) => LoginUserCubit(
            authrepoimpl,
            shared,
            FirebaseFirestore.instance,
          ),
        ),
        BlocProvider(
          create: (context) => ResetPasswordCubit(authrepoimpl),
        ),
      ],
      child: MaterialApp(
        title: 'Fire Chat',
        themeMode: ThemeMode.system,
        theme: AppThemes.lightTheme(),
        darkTheme: AppThemes.darkTheme(),
        debugShowCheckedModeBanner: false,
        routes: {
          SplashView.id: (context) => const SplashView(),
          RegisterView.id: (context) => const RegisterView(),
        },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case LoginView.id:
              return PageTransition(
                child: const LoginView(),
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 300),
                settings: settings,
              );
            case HomeView.id:
              return PageTransition(
                child: const HomeView(),
                type: PageTransitionType.fade,
                childCurrent: this,
                alignment: Alignment.center,
                duration: const Duration(milliseconds: 300),
                settings: settings,
              );
            case ResetPasswordView.id:
              return PageTransition(
                child: const ResetPasswordView(),
                type: PageTransitionType.fade,
                childCurrent: this,
                alignment: Alignment.center,
                duration: const Duration(milliseconds: 300),
                settings: settings,
              );
          }
          return null;
        },
      ),
    );
  }
}

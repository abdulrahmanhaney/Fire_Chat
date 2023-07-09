import 'package:fire_chat/Core/styles/text_styles.dart';
import 'package:fire_chat/Core/utils/service_lactor.dart';
import 'package:fire_chat/Featured/Auth/presentataion/views/register_view.dart';
import 'package:fire_chat/Featured/Home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;
  var shared = getIt.get<SharedPreferences>();

  @override
  void initState() {
    super.initState();
    initAnimation();
    navigateToAnotherScreen();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FadeTransition(
            opacity: fadeAnimation,
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.height * 0.100,
              child: const Icon(
                Icons.whatshot_sharp,
                size: 100,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SlideTransition(
            position: slideAnimation,
            child: Text(
              'Fire Chat',
              textAlign: TextAlign.center,
              style: AppTextStyles.s30b,
            ),
          ),
        ],
      ),
    );
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    fadeAnimation = Tween<double>(begin: 0.7, end: 1).animate(
      animationController,
    );
    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(
      animationController,
    );
    animationController.forward();
  }

  Future<void> navigateToAnotherScreen() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (shared.getString('userInfo')?.isEmpty ?? true) {
          Navigator.of(context).pushReplacementNamed(RegisterView.id);
        } else {
          Navigator.of(context).pushReplacementNamed(HomeView.id);
        }
      },
    );
  }
}

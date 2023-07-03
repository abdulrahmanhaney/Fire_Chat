import 'package:fire_chat/Core/styles/text_styles.dart';
import 'package:fire_chat/Featured/Auth/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              backgroundColor: Colors.black,
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
            child: const Text(
              'Fire Chat',
              textAlign: TextAlign.center,
              style: AppTextStyles.s30,
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

  void navigateToAnotherScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).push(RegisterView.id);
      },
    );
  }
}

import 'package:fire_chat/Featured/Home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const id = '/HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeViewBody(),
    );
  }
}

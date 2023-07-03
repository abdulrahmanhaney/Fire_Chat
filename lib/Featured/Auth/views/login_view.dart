import 'package:fire_chat/Featured/Auth/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const id = '/LoginView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginViewBody(),
    );
  }
}

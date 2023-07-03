import 'package:fire_chat/Featured/Auth/presentataion/views/widgets/reset_password_view_body.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  static const id = 'ResetPasswordView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResetPasswordViewBody(),
    );
  }
}

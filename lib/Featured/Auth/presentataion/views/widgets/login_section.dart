import 'package:fire_chat/Featured/Auth/presentataion/views/reset_password_view.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/styles/text_styles.dart';
import 'custom_text_field.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Login Now',
            style: AppTextStyles.s20b,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            icon: Icons.email,
            hint: 'Email',
          ),
          CustomTextField(
            icon: Icons.password,
            hint: 'Password',
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ResetPasswordView.id);
            },
            child: const Text(
              'Forget Your Password ?',
              style: AppTextStyles.s14b,
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Login'),
          )
        ],
      ),
    );
  }
}

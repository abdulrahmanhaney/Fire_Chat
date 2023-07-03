import 'package:flutter/material.dart';

import '../../../../Core/styles/text_styles.dart';
import 'custom_text_field.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const Text(
            'Login Now',
            style: AppTextStyles.s20b,
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
          ElevatedButton(
            onPressed: () {},
            child: const Text('Register'),
          )
        ],
      ),
    );
  }
}

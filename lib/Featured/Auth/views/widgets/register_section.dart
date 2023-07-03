import 'package:fire_chat/Core/styles/text_styles.dart';
import 'package:fire_chat/Featured/Auth/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterSection extends StatelessWidget {
  const RegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const Text(
            'Register Now',
            style: AppTextStyles.s20b,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            icon: Icons.person,
            hint: 'Username',
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

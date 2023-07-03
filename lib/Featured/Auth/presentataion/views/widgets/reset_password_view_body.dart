import 'package:flutter/material.dart';

import '../../../../../Core/styles/text_styles.dart';
import 'action_row.dart';
import 'app_logo.dart';
import 'custom_text_field.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              const AppLogo(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Reset Your Password',
                textAlign: TextAlign.center,
                style: AppTextStyles.s20b,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                icon: Icons.email,
                hint: 'Email',
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Reset Password'),
              ),
              const SizedBox(
                height: 15,
              ),
              ActionRow(
                text: 'Rememberd Your Password ?',
                actionText: 'Login Now',
                onTap: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fire_chat/Featured/Auth/presentataion/manager/login_user_cubit/login_user_cubit.dart';
import 'package:fire_chat/Featured/Auth/presentataion/views/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/styles/text_styles.dart';
import 'custom_password_text_field.dart';
import 'custom_text_field.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  late String email;
  late String passWord;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: key,
        autovalidateMode: autovalidateMode,
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
              onCahange: (p0) {
                email = p0;
              },
              validator: (p0) {
                if (p0?.isEmpty ?? true) {
                  return "Email Can't be empty";
                }
                if (!p0!.contains('@')) {
                  return "Error in email format";
                }
                return null;
              },
            ),
            CustomPassWordTextField(
              hint: 'Password',
              onCahange: (p0) {
                passWord = p0;
              },
              validator: (p0) {
                if (p0?.isEmpty ?? true) {
                  return "Password Can't be empty";
                }
                return null;
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  ResetPasswordView.id,
                  (Route<dynamic> route) => false,
                );
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
              onPressed: () {
                if (key.currentState!.validate()) {
                  BlocProvider.of<LoginUserCubit>(context)
                      .loginUser(email: email, passWord: passWord);
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
